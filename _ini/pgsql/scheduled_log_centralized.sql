/*
 Navicat Premium Data Transfer

 Source Server         : localhost_pgsql
 Source Server Type    : PostgreSQL
 Source Server Version : 150005 (150005)
 Source Host           : localhost:5432
 Source Catalog        : taybct-cloud
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150005 (150005)
 File Encoding         : 65001

 Date: 18/03/2026 16:43:59
*/


-- ----------------------------
-- Table structure for scheduled_log_centralized
-- ----------------------------
DROP TABLE IF EXISTS "public"."scheduled_log_centralized";
CREATE TABLE "public"."scheduled_log_centralized" (
  "id" int8 NOT NULL,
  "success_time" timestamp(6),
  "run_id" varchar(255) COLLATE "pg_catalog"."default",
  "module_name" varchar(255) COLLATE "pg_catalog"."default",
  "method_name" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "log" text COLLATE "pg_catalog"."default",
  "insert_time" timestamp(6),
  "parent_run_id" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."scheduled_log_centralized"."success_time" IS '生成日志时间';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."run_id" IS '本次运行id';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."module_name" IS '模块名称';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."method_name" IS '方法名称';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."status" IS '是否成功';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."log" IS '日志内容';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."insert_time" IS '插入时间';
COMMENT ON COLUMN "public"."scheduled_log_centralized"."parent_run_id" IS '父级调用runId';
COMMENT ON TABLE "public"."scheduled_log_centralized" IS '定时任务控制台日志管理';

-- ----------------------------
-- Indexes structure for table scheduled_log_centralized
-- ----------------------------
CREATE INDEX "idx_scheduled_log_centralized_method_name" ON "public"."scheduled_log_centralized" USING btree (
  "method_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_scheduled_log_centralized_module_name" ON "public"."scheduled_log_centralized" USING btree (
  "module_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_scheduled_log_centralized_parent_run_id" ON "public"."scheduled_log_centralized" USING btree (
  "parent_run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_scheduled_log_centralized_run_id" ON "public"."scheduled_log_centralized" USING btree (
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_scheduled_log_centralized_status" ON "public"."scheduled_log_centralized" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table scheduled_log_centralized
-- ----------------------------
ALTER TABLE "public"."scheduled_log_centralized" ADD CONSTRAINT "custom_scheduled_log_pkey" PRIMARY KEY ("id");
