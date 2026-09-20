/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 150000 (150000)
 Source Host           : localhost:5432
 Source Catalog        : taybct
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150000 (150000)
 File Encoding         : 65001

 Date: 20/09/2026 15:48:57
*/


-- ----------------------------
-- Table structure for api_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_log";
CREATE TABLE "public"."api_log" (
  "id" int8 NOT NULL,
  "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(200) COLLATE "pg_catalog"."default",
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "client" varchar(30) COLLATE "pg_catalog"."default",
  "module" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "ip" varchar(128) COLLATE "pg_catalog"."default",
  "type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(10) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "params" varchar(2000) COLLATE "pg_catalog"."default",
  "result" varchar(2000) COLLATE "pg_catalog"."default",
  "code" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."api_log"."id" IS '主键';
COMMENT ON COLUMN "public"."api_log"."title" IS '模块标题';
COMMENT ON COLUMN "public"."api_log"."description" IS '接口描述';
COMMENT ON COLUMN "public"."api_log"."username" IS '操作人员';
COMMENT ON COLUMN "public"."api_log"."client" IS '客户端类型';
COMMENT ON COLUMN "public"."api_log"."module" IS '模块名';
COMMENT ON COLUMN "public"."api_log"."ip" IS '主机地址';
COMMENT ON COLUMN "public"."api_log"."type" IS '业务类型';
COMMENT ON COLUMN "public"."api_log"."method" IS '请求方式';
COMMENT ON COLUMN "public"."api_log"."url" IS '请求URL';
COMMENT ON COLUMN "public"."api_log"."params" IS '请求参数';
COMMENT ON COLUMN "public"."api_log"."result" IS '返回参数';
COMMENT ON COLUMN "public"."api_log"."code" IS '状态码';
COMMENT ON COLUMN "public"."api_log"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."api_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."api_log"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."api_log"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."api_log"."tenant_id" IS '租户id';
COMMENT ON TABLE "public"."api_log" IS '系统日志';

-- ----------------------------
-- Records of api_log
-- ----------------------------

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS "public"."authorities";
CREATE TABLE "public"."authorities" (
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "authority" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON TABLE "public"."authorities" IS 'spring security 用户角色关联表';

-- ----------------------------
-- Records of authorities
-- ----------------------------

-- ----------------------------
-- Table structure for lf_design
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_design";
CREATE TABLE "public"."lf_design" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 DEFAULT 0,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "data" jsonb,
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "last_version" int8
)
;
COMMENT ON COLUMN "public"."lf_design"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_design"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."lf_design"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_design"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."lf_design"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."lf_design"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."lf_design"."name" IS '名称';
COMMENT ON COLUMN "public"."lf_design"."status" IS '状态(0未发布，1已经发布)';
COMMENT ON COLUMN "public"."lf_design"."description" IS '备注说明';
COMMENT ON COLUMN "public"."lf_design"."data" IS '数据（实时设计最新的流程数据）';
COMMENT ON COLUMN "public"."lf_design"."type" IS '流程类型（字典项 lf_process_type）';
COMMENT ON COLUMN "public"."lf_design"."icon" IS '图标';
COMMENT ON COLUMN "public"."lf_design"."last_version" IS '最后发布版本号';
COMMENT ON TABLE "public"."lf_design" IS '流程图设计';

-- ----------------------------
-- Records of lf_design
-- ----------------------------
INSERT INTO "public"."lf_design" VALUES (1968238470464376834, 1, '2025-09-17 16:59:54.11852', 1, '2025-10-11 17:24:00.757762', 0, '请假流程', 1, NULL, '{"edges": [{"id": "e7b489a08442403f9b152354a066c666", "type": "custom-edge-line", "endPoint": {"x": -290, "y": -330}, "pointsList": [{"x": -370, "y": -330}, {"x": -290, "y": -330}], "properties": {}, "startPoint": {"x": -370, "y": -330}, "sourceNodeId": "4b4ed343e6bb46c4a5d93b1f80c3903d", "targetNodeId": "c5fc27d82cc148b9b1f578e03b91dceb"}, {"id": "fb78119e22594a66ae18ce43d869e141", "type": "custom-edge-line", "endPoint": {"x": -110, "y": -330}, "pointsList": [{"x": -190, "y": -330}, {"x": -110, "y": -330}], "properties": {}, "startPoint": {"x": -190, "y": -330}, "sourceNodeId": "c5fc27d82cc148b9b1f578e03b91dceb", "targetNodeId": "64f28d65b09849999052cb9075e693be"}, {"id": "d5fe54d720f1422b8525b0891450e865", "text": {"x": 0, "y": -330, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 50, "y": -330, "id": "-100--370"}, "pointsList": [{"x": -50, "y": -330}, {"x": 50, "y": -330}], "properties": {"condition": "SpEL", "expression": "!#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$"}, "startPoint": {"x": -50, "y": -330, "id": "-200--370"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "f9156ceea6b64afba948251df990c8fa"}, {"id": "14715d7893a14edcbc61aaf8c00e31bf", "text": {"x": -80, "y": -230, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": -80, "y": -180, "id": "-230--220"}, "pointsList": [{"x": -80, "y": -280}, {"x": -80, "y": -180}], "properties": {"condition": "SpEL", "expression": "#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": -80, "y": -280, "id": "-230--320"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "a1960c98cef541ec9736d2d0830a54ab"}, {"id": "1990705cc0694e42b94044cad6861125", "type": "custom-edge-line", "endPoint": {"x": 70, "y": -140, "id": "-80--180"}, "pointsList": [{"x": -30, "y": -140}, {"x": 70, "y": -140}], "properties": {}, "startPoint": {"x": -30, "y": -140, "id": "-180--180"}, "sourceNodeId": "a1960c98cef541ec9736d2d0830a54ab", "targetNodeId": "d256a21fdbf64171a50e84b9bfae6f1e"}, {"id": "b1169e25d3454e4bab53e81677a15c3e", "text": {"x": 175, "y": -140, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 220, "y": -140, "id": "70--180"}, "pointsList": [{"x": 130, "y": -140}, {"x": 220, "y": -140}], "properties": {"condition": "SpEL", "expression": "!#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$"}, "startPoint": {"x": 130, "y": -140, "id": "-20--180"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "00a4d5f8588c450aa0df7b3132677a6a"}, {"id": "2b21609bc3e14e6bb304e7668cbc0e66", "text": {"x": 100, "y": -40, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": 100, "y": 10, "id": "-50--30"}, "pointsList": [{"x": 100, "y": -90}, {"x": 100, "y": 10}], "properties": {"condition": "SpEL", "expression": "#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": 100, "y": -90, "id": "-50--130"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "bd986a38799f4c82b265170f359764d0"}], "nodes": [{"x": -420, "y": -330, "id": "4b4ed343e6bb46c4a5d93b1f80c3903d", "text": {"x": -420, "y": -331, "value": "提交请假申请"}, "type": "custom-node-start", "properties": {"fields": [{"key": "fe7329fc03a30431797da48b3cfbc4eb7", "name": "name", "sort": 0, "type": "STRING", "title": "姓名", "value": "", "disabled": false, "readonly": false}, {"key": "f884e56cbf5584885b77ed08aa66b165c", "name": "kind", "sort": "0", "type": "STRING", "title": "请假类型", "value": "", "disabled": false, "readonly": false}, {"key": "fb7f6bdd80a9040e79d0f64742b282c53", "name": "reason", "sort": 1, "type": "STRING", "title": "请假理由", "value": "", "disabled": false, "readonly": false}, {"key": "f3a5feb6e4e864e798b47b1e204f593f9", "name": "howLong", "sort": 2, "type": "NUMBER", "title": "时长", "disabled": false, "readonly": false}, {"key": "fe62e78c6f79e462db435526424aab7c7", "name": "timeUnit", "sort": 3, "type": "STRING", "title": "时间单位", "value": "", "disabled": false, "readonly": false}], "formBind": {"id": "1968263061492568065", "name": "请假流程开始表单.release.20250917183731"}, "documentation": "请假流程"}}, {"x": -240, "y": -330, "id": "c5fc27d82cc148b9b1f578e03b91dceb", "text": {"x": -240, "y": -330, "value": "小组长审批"}, "type": "custom-node-user", "properties": {"fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "userIdList": [{"id": "1963080001398505474", "name": "小组长"}], "autoExecute": false}}, {"x": -80, "y": -330, "id": "64f28d65b09849999052cb9075e693be", "text": {"x": -80, "y": -330, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 100, "y": -330, "id": "f9156ceea6b64afba948251df990c8fa", "text": {"x": 100, "y": -330, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": -80, "y": -140, "id": "a1960c98cef541ec9736d2d0830a54ab", "text": {"x": -80, "y": -140, "value": "领导审批"}, "type": "custom-node-user", "properties": {"roles": [], "fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "deptIdList": [], "userIdList": [{"id": "1963084850613714945", "name": "部门领导"}, {"id": "1963085401439076353", "name": "总经理"}], "autoExecute": false, "isCountersign": true}}, {"x": 100, "y": -140, "id": "d256a21fdbf64171a50e84b9bfae6f1e", "text": {"x": 100, "y": -140, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 270, "y": -140, "id": "00a4d5f8588c450aa0df7b3132677a6a", "text": {"x": 270, "y": -140, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": 100, "y": 60, "id": "bd986a38799f4c82b265170f359764d0", "text": {"x": 100, "y": 60, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowAlarmArchived", "success": true, "condition": "topic", "autoExecute": true}}]}', 'normal', 'ep:avatar', 20251011172400);

-- ----------------------------
-- Table structure for lf_design_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_design_permissions";
CREATE TABLE "public"."lf_design_permissions" (
  "id" int8 NOT NULL,
  "design_id" int8 NOT NULL,
  "user_id" int8,
  "dept_id" int8,
  "perm_edit" int2,
  "perm_delete" int2,
  "perm_publish" int2,
  "perm_share" int2
)
;
COMMENT ON COLUMN "public"."lf_design_permissions"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_design_permissions"."design_id" IS '设计图 id';
COMMENT ON COLUMN "public"."lf_design_permissions"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."lf_design_permissions"."dept_id" IS '部门id';
COMMENT ON COLUMN "public"."lf_design_permissions"."perm_edit" IS '编辑权限';
COMMENT ON COLUMN "public"."lf_design_permissions"."perm_delete" IS '删除权限';
COMMENT ON COLUMN "public"."lf_design_permissions"."perm_publish" IS '发布权限';
COMMENT ON COLUMN "public"."lf_design_permissions"."perm_share" IS '分享权限';
COMMENT ON TABLE "public"."lf_design_permissions" IS '流程图权限表';

-- ----------------------------
-- Records of lf_design_permissions
-- ----------------------------
INSERT INTO "public"."lf_design_permissions" VALUES (1968238470464376835, 1968238470464376834, 1, NULL, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for lf_edges
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_edges";
CREATE TABLE "public"."lf_edges" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "source_node_id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "target_node_id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "properties" jsonb,
  "text" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "process_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."lf_edges"."id" IS '主键（节点的id，这里是使用前端生成的 uuid）';
COMMENT ON COLUMN "public"."lf_edges"."source_node_id" IS '起始节点 id';
COMMENT ON COLUMN "public"."lf_edges"."target_node_id" IS '指向节点 id';
COMMENT ON COLUMN "public"."lf_edges"."properties" IS '线的属性数据';
COMMENT ON COLUMN "public"."lf_edges"."text" IS '线上的文字';
COMMENT ON COLUMN "public"."lf_edges"."type" IS '线类型（字典项 lf_node_type）';
COMMENT ON COLUMN "public"."lf_edges"."process_id" IS '流程 id';
COMMENT ON TABLE "public"."lf_edges" IS '流程连线表';

-- ----------------------------
-- Records of lf_edges
-- ----------------------------

-- ----------------------------
-- Table structure for lf_form
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_form";
CREATE TABLE "public"."lf_form" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 DEFAULT 0,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "data" jsonb,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(500) COLLATE "pg_catalog"."default",
  "last_version" int8
)
;
COMMENT ON COLUMN "public"."lf_form"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_form"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."lf_form"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_form"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."lf_form"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."lf_form"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."lf_form"."name" IS '名称';
COMMENT ON COLUMN "public"."lf_form"."status" IS '状态(0未发布，1已经发布)';
COMMENT ON COLUMN "public"."lf_form"."description" IS '备注说明';
COMMENT ON COLUMN "public"."lf_form"."data" IS '数据（实时设计最新的表单数据）';
COMMENT ON COLUMN "public"."lf_form"."type" IS '表单类型，是表单还是单组件（字典项 lf_form_type）';
COMMENT ON COLUMN "public"."lf_form"."path" IS '表单组件路径';
COMMENT ON COLUMN "public"."lf_form"."last_version" IS '最后发布版本号';
COMMENT ON TABLE "public"."lf_form" IS '流程表单';

-- ----------------------------
-- Records of lf_form
-- ----------------------------
INSERT INTO "public"."lf_form" VALUES (1968239272096534529, 1, '2025-09-17 17:03:05.250565', 1, '2025-09-17 18:37:37.102214', 0, '请假流程开始表单', 1, NULL, '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_F6oxmfnrnywlazc\",\"name\":\"ref_Fr63mfnrnywlb0c\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"select\",\"field\":\"kind\",\"title\":\"请假类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"自己请假\",\"value\":\"1\"},{\"label\":\"帮助同事\",\"value\":\"2\"}],\"_fc_id\":\"id_F39tmfnr9f9zafc\",\"name\":\"ref_Fvftmfnr9f9zagc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"select\",\"field\":\"type\",\"title\":\"假期类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"事假\",\"value\":\"1\"},{\"label\":\"病假\",\"value\":\"2\"},{\"label\":\"年假\",\"value\":\"3\"},{\"label\":\"婚假\",\"value\":\"4\"},{\"label\":\"丧葬\",\"value\":\"5\"}],\"_fc_id\":\"id_F0b5mfnuhx8oacc\",\"name\":\"ref_Fmcomfnuhx8oadc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"input\",\"field\":\"name\",\"title\":\"姓名\",\"info\":\"也可以代为他人请假，多个人按逗号隔开\",\"$required\":true,\"_fc_id\":\"id_F65smfnr80h5acc\",\"name\":\"ref_Frjqmfnr80h5adc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\"},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"请假理由\",\"info\":\"\",\"$required\":\"必须填写请假理由\",\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fgs1mfnrb2k5aic\",\"name\":\"ref_Fx65mfnrb2k5ajc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"},{\"type\":\"fcRow\",\"children\":[{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"input\",\"field\":\"howLong\",\"title\":\"时长\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"number\",\"min\":0.5},\"_fc_id\":\"id_Fzkpmfnrd1ujalc\",\"name\":\"ref_Flo5mfnrd1ujamc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\",\"_fc_store\":{\"props_keys\":[\"min\"]}}],\"_fc_id\":\"id_F8k6mfnrdmgxapc\",\"name\":\"ref_Fin2mfnrdmgxaqc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"},{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"radio\",\"field\":\"timeUnit\",\"title\":\"\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":false,\"options\":[{\"label\":\"小时\",\"value\":\"h\"},{\"label\":\"天\",\"value\":\"d\"}],\"_fc_id\":\"id_F2tymfnrh87iaxc\",\"name\":\"ref_Fkmqmfnrh87iayc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"radio\",\"style\":{\"marginLeft\":\"20px\"}}],\"_fc_id\":\"id_Fbe7mfnrdmgxarc\",\"name\":\"ref_Ffaamfnrdmgxasc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"}],\"_fc_id\":\"id_Fxvhmfnrdmgxanc\",\"name\":\"ref_Ffp1mfnrdmgxaoc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"fcRow\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"kind\":\"1\",\"howLong\":\"4\",\"timeUnit\":\"h\"}}"}', 'form', NULL, 20250917183737);
INSERT INTO "public"."lf_form" VALUES (1968257092406579202, 1, '2025-09-17 18:13:53.945459', 1, '2025-09-17 18:25:38.732638', 0, '是否审批通过表单', 1, NULL, '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_Fh3mmfntr3xlabc\",\"name\":\"ref_Fht4mfntr3xlacc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"switch\",\"field\":\"approve\",\"title\":\"批准\",\"info\":\"\",\"$required\":true,\"props\":{\"activeValue\":true,\"inactiveValue\":false},\"_fc_id\":\"id_Fwdymfntr8apaec\",\"name\":\"ref_Fmatmfntr8apafc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"switch\",\"value\":true,\"control\":[{\"method\":\"if\",\"condition\":\"==\",\"value\":false,\"rule\":[\"reason\"]}]},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"理由\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fq7nmfntrx56ahc\",\"name\":\"ref_Fipemfntrx56aic\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"aprove\":true}}"}', 'form', NULL, 20250917182538);

-- ----------------------------
-- Table structure for lf_form_release
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_form_release";
CREATE TABLE "public"."lf_form_release" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 DEFAULT 0,
  "form_id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "data" jsonb NOT NULL,
  "version" int8 NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."lf_form_release"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_form_release"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."lf_form_release"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_form_release"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."lf_form_release"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."lf_form_release"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."lf_form_release"."form_id" IS '表单 id';
COMMENT ON COLUMN "public"."lf_form_release"."name" IS '发布名称';
COMMENT ON COLUMN "public"."lf_form_release"."status" IS '状态(0 关闭 1 打开)';
COMMENT ON COLUMN "public"."lf_form_release"."description" IS '备注说明';
COMMENT ON COLUMN "public"."lf_form_release"."data" IS '数据（每个版本的数据）';
COMMENT ON COLUMN "public"."lf_form_release"."version" IS '版本号（yyyyMMddHHmmss）';
COMMENT ON COLUMN "public"."lf_form_release"."type" IS '表单类型，是表单还是单组件（字典项 lf_form_type）';
COMMENT ON COLUMN "public"."lf_form_release"."path" IS '表单组件路径';
COMMENT ON TABLE "public"."lf_form_release" IS '流程表单发布表';

-- ----------------------------
-- Records of lf_form_release
-- ----------------------------
INSERT INTO "public"."lf_form_release" VALUES (1968242302338568193, 1, '2025-09-17 17:15:07.723058', 1, '2025-09-17 17:15:07.723058', 0, 1968239272096534529, '请假流程开始表单.release.20250917171501', 1, '请假流程开始', '{"rule": "[{\"type\":\"select\",\"field\":\"kind\",\"title\":\"请假类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"自己请假\",\"value\":\"1\"},{\"label\":\"帮助同事\",\"value\":\"2\"}],\"_fc_id\":\"id_F39tmfnr9f9zafc\",\"name\":\"ref_Fvftmfnr9f9zagc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"input\",\"field\":\"name\",\"title\":\"姓名\",\"info\":\"也可以代为他人请假，多个人按逗号隔开\",\"$required\":true,\"_fc_id\":\"id_F65smfnr80h5acc\",\"name\":\"ref_Frjqmfnr80h5adc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\"},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"请假理由\",\"info\":\"\",\"$required\":\"必须填写请假理由\",\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fgs1mfnrb2k5aic\",\"name\":\"ref_Fx65mfnrb2k5ajc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"},{\"type\":\"fcRow\",\"children\":[{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"input\",\"field\":\"howLong\",\"title\":\"时长\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"number\",\"min\":0.5},\"_fc_id\":\"id_Fzkpmfnrd1ujalc\",\"name\":\"ref_Flo5mfnrd1ujamc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\",\"_fc_store\":{\"props_keys\":[\"min\"]}}],\"_fc_id\":\"id_F8k6mfnrdmgxapc\",\"name\":\"ref_Fin2mfnrdmgxaqc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"},{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"radio\",\"field\":\"timeUnit\",\"title\":\"\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":false,\"options\":[{\"label\":\"小时\",\"value\":\"h\"},{\"label\":\"天\",\"value\":\"d\"}],\"_fc_id\":\"id_F2tymfnrh87iaxc\",\"name\":\"ref_Fkmqmfnrh87iayc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"radio\",\"style\":{\"marginLeft\":\"20px\"}}],\"_fc_id\":\"id_Fbe7mfnrdmgxarc\",\"name\":\"ref_Ffaamfnrdmgxasc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"}],\"_fc_id\":\"id_Fxvhmfnrdmgxanc\",\"name\":\"ref_Ffp1mfnrdmgxaoc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"fcRow\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"kind\":\"1\",\"howLong\":\"4\",\"timeUnit\":\"h\"}}"}', 20250917171507, 'form', NULL);
INSERT INTO "public"."lf_form_release" VALUES (1968242557142536193, 1, '2025-09-17 17:16:08.458339', 1, '2025-09-17 17:16:08.458339', 0, 1968239272096534529, '请假流程开始表单.release.20250917171556', 1, '可以查看流程信息', '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_F6oxmfnrnywlazc\",\"name\":\"ref_Fr63mfnrnywlb0c\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"select\",\"field\":\"kind\",\"title\":\"请假类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"自己请假\",\"value\":\"1\"},{\"label\":\"帮助同事\",\"value\":\"2\"}],\"_fc_id\":\"id_F39tmfnr9f9zafc\",\"name\":\"ref_Fvftmfnr9f9zagc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"input\",\"field\":\"name\",\"title\":\"姓名\",\"info\":\"也可以代为他人请假，多个人按逗号隔开\",\"$required\":true,\"_fc_id\":\"id_F65smfnr80h5acc\",\"name\":\"ref_Frjqmfnr80h5adc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\"},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"请假理由\",\"info\":\"\",\"$required\":\"必须填写请假理由\",\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fgs1mfnrb2k5aic\",\"name\":\"ref_Fx65mfnrb2k5ajc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"},{\"type\":\"fcRow\",\"children\":[{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"input\",\"field\":\"howLong\",\"title\":\"时长\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"number\",\"min\":0.5},\"_fc_id\":\"id_Fzkpmfnrd1ujalc\",\"name\":\"ref_Flo5mfnrd1ujamc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\",\"_fc_store\":{\"props_keys\":[\"min\"]}}],\"_fc_id\":\"id_F8k6mfnrdmgxapc\",\"name\":\"ref_Fin2mfnrdmgxaqc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"},{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"radio\",\"field\":\"timeUnit\",\"title\":\"\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":false,\"options\":[{\"label\":\"小时\",\"value\":\"h\"},{\"label\":\"天\",\"value\":\"d\"}],\"_fc_id\":\"id_F2tymfnrh87iaxc\",\"name\":\"ref_Fkmqmfnrh87iayc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"radio\",\"style\":{\"marginLeft\":\"20px\"}}],\"_fc_id\":\"id_Fbe7mfnrdmgxarc\",\"name\":\"ref_Ffaamfnrdmgxasc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"}],\"_fc_id\":\"id_Fxvhmfnrdmgxanc\",\"name\":\"ref_Ffp1mfnrdmgxaoc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"fcRow\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"kind\":\"1\",\"howLong\":\"4\",\"timeUnit\":\"h\"}}"}', 20250917171608, 'form', NULL);
INSERT INTO "public"."lf_form_release" VALUES (1968258988353622017, 1, '2025-09-17 18:21:25.971315', 1, '2025-09-17 18:21:25.971315', 0, 1968257092406579202, '是否审批通过表单.release.20250917182119', 1, '批准表单', '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_Fh3mmfntr3xlabc\",\"name\":\"ref_Fht4mfntr3xlacc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"switch\",\"field\":\"aprove\",\"title\":\"批准\",\"info\":\"\",\"$required\":true,\"props\":{\"activeValue\":true,\"inactiveValue\":false},\"_fc_id\":\"id_Fwdymfntr8apaec\",\"name\":\"ref_Fmatmfntr8apafc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"switch\",\"control\":[{\"method\":\"if\",\"condition\":\"==\",\"value\":false,\"rule\":[\"reason\"]}]},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"理由\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fq7nmfntrx56ahc\",\"name\":\"ref_Fipemfntrx56aic\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"aprove\":true}}"}', 20250917182125, 'form', NULL);
INSERT INTO "public"."lf_form_release" VALUES (1968260048388460545, 1, '2025-09-17 18:25:38.708638', 1, '2025-09-17 18:25:38.708638', 0, 1968257092406579202, '是否审批通过表单.release.20250917182529', 1, '单词拼错了', '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_Fh3mmfntr3xlabc\",\"name\":\"ref_Fht4mfntr3xlacc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"switch\",\"field\":\"approve\",\"title\":\"批准\",\"info\":\"\",\"$required\":true,\"props\":{\"activeValue\":true,\"inactiveValue\":false},\"_fc_id\":\"id_Fwdymfntr8apaec\",\"name\":\"ref_Fmatmfntr8apafc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"switch\",\"value\":true,\"control\":[{\"method\":\"if\",\"condition\":\"==\",\"value\":false,\"rule\":[\"reason\"]}]},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"理由\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fq7nmfntrx56ahc\",\"name\":\"ref_Fipemfntrx56aic\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"aprove\":true}}"}', 20250917182538, 'form', NULL);
INSERT INTO "public"."lf_form_release" VALUES (1968263061492568065, 1, '2025-09-17 18:37:37.081432', 1, '2025-09-17 18:37:37.081432', 0, 1968239272096534529, '请假流程开始表单.release.20250917183731', 1, '添加了请假类型', '{"rule": "[{\"type\":\"LfFormTodoInfo\",\"field\":\"flowInfo\",\"title\":\"\",\"info\":\"请不要修改字段 ID (flowInfo)，仅展示流程信息\",\"_fc_id\":\"id_F6oxmfnrnywlazc\",\"name\":\"ref_Fr63mfnrnywlb0c\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"LfFormTodoInfo\"},{\"type\":\"select\",\"field\":\"kind\",\"title\":\"请假类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"自己请假\",\"value\":\"1\"},{\"label\":\"帮助同事\",\"value\":\"2\"}],\"_fc_id\":\"id_F39tmfnr9f9zafc\",\"name\":\"ref_Fvftmfnr9f9zagc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"select\",\"field\":\"type\",\"title\":\"假期类型\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":true,\"options\":[{\"label\":\"事假\",\"value\":\"1\"},{\"label\":\"病假\",\"value\":\"2\"},{\"label\":\"年假\",\"value\":\"3\"},{\"label\":\"婚假\",\"value\":\"4\"},{\"label\":\"丧葬\",\"value\":\"5\"}],\"_fc_id\":\"id_F0b5mfnuhx8oacc\",\"name\":\"ref_Fmcomfnuhx8oadc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"select\"},{\"type\":\"input\",\"field\":\"name\",\"title\":\"姓名\",\"info\":\"也可以代为他人请假，多个人按逗号隔开\",\"$required\":true,\"_fc_id\":\"id_F65smfnr80h5acc\",\"name\":\"ref_Frjqmfnr80h5adc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\"},{\"type\":\"input\",\"field\":\"reason\",\"title\":\"请假理由\",\"info\":\"\",\"$required\":\"必须填写请假理由\",\"props\":{\"type\":\"textarea\"},\"_fc_id\":\"id_Fgs1mfnrb2k5aic\",\"name\":\"ref_Fx65mfnrb2k5ajc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"textarea\"},{\"type\":\"fcRow\",\"children\":[{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"input\",\"field\":\"howLong\",\"title\":\"时长\",\"info\":\"\",\"$required\":true,\"props\":{\"type\":\"number\",\"min\":0.5},\"_fc_id\":\"id_Fzkpmfnrd1ujalc\",\"name\":\"ref_Flo5mfnrd1ujamc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"input\",\"_fc_store\":{\"props_keys\":[\"min\"]}}],\"_fc_id\":\"id_F8k6mfnrdmgxapc\",\"name\":\"ref_Fin2mfnrdmgxaqc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"},{\"type\":\"col\",\"props\":{\"span\":12},\"children\":[{\"type\":\"radio\",\"field\":\"timeUnit\",\"title\":\"\",\"info\":\"\",\"effect\":{\"fetch\":\"\"},\"$required\":false,\"options\":[{\"label\":\"小时\",\"value\":\"h\"},{\"label\":\"天\",\"value\":\"d\"}],\"_fc_id\":\"id_F2tymfnrh87iaxc\",\"name\":\"ref_Fkmqmfnrh87iayc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"radio\",\"style\":{\"marginLeft\":\"20px\"}}],\"_fc_id\":\"id_Fbe7mfnrdmgxarc\",\"name\":\"ref_Ffaamfnrdmgxasc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"col\"}],\"_fc_id\":\"id_Fxvhmfnrdmgxanc\",\"name\":\"ref_Ffp1mfnrdmgxaoc\",\"display\":true,\"hidden\":false,\"_fc_drag_tag\":\"fcRow\"}]", "options": "{\"form\":{\"inline\":false,\"hideRequiredAsterisk\":false,\"labelPosition\":\"right\",\"size\":\"default\",\"labelWidth\":\"125px\"},\"resetBtn\":{\"show\":false,\"innerText\":\"重置\"},\"submitBtn\":{\"show\":true,\"innerText\":\"提交\"},\"formData\":{\"kind\":\"1\",\"howLong\":\"4\",\"timeUnit\":\"h\"}}"}', 20250917183737, 'form', NULL);

-- ----------------------------
-- Table structure for lf_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_history";
CREATE TABLE "public"."lf_history" (
  "id" int8 NOT NULL,
  "time" timestamp(6) NOT NULL,
  "user_id" int8,
  "dept_id" int8,
  "process_id" int8 NOT NULL,
  "action" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int8 NOT NULL,
  "data" jsonb,
  "node_id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "post_id" int8,
  "node_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."lf_history"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_history"."time" IS '操作时间';
COMMENT ON COLUMN "public"."lf_history"."user_id" IS '操作人 id';
COMMENT ON COLUMN "public"."lf_history"."dept_id" IS '操作人的部门';
COMMENT ON COLUMN "public"."lf_history"."process_id" IS '流程 id';
COMMENT ON COLUMN "public"."lf_history"."action" IS '动作（节点的 text 或者单独有个 action 的属性）';
COMMENT ON COLUMN "public"."lf_history"."sort" IS '操作顺序';
COMMENT ON COLUMN "public"."lf_history"."data" IS '当前节点操作的数据';
COMMENT ON COLUMN "public"."lf_history"."node_id" IS '当前操作的节点 id';
COMMENT ON COLUMN "public"."lf_history"."post_id" IS '操作人的岗位';
COMMENT ON COLUMN "public"."lf_history"."node_type" IS '当前节点类型（字典项 lf_node_type）';
COMMENT ON TABLE "public"."lf_history" IS '流程历史';

-- ----------------------------
-- Records of lf_history
-- ----------------------------

-- ----------------------------
-- Table structure for lf_nodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_nodes";
CREATE TABLE "public"."lf_nodes" (
  "id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "process_id" int8 NOT NULL,
  "properties" jsonb,
  "text" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."lf_nodes"."id" IS '主键（节点的id，这里是使用前端生成的 uuid）';
COMMENT ON COLUMN "public"."lf_nodes"."process_id" IS '流程 id';
COMMENT ON COLUMN "public"."lf_nodes"."properties" IS '节点的属性数据';
COMMENT ON COLUMN "public"."lf_nodes"."text" IS '节点上的文字';
COMMENT ON COLUMN "public"."lf_nodes"."type" IS '节点类型（字典项 lf_node_type）';
COMMENT ON TABLE "public"."lf_nodes" IS '流程节点';

-- ----------------------------
-- Records of lf_nodes
-- ----------------------------

-- ----------------------------
-- Table structure for lf_present_process
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_present_process";
CREATE TABLE "public"."lf_present_process" (
  "process_id" int8 NOT NULL,
  "node_id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "node_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."lf_present_process"."process_id" IS '流程 id';
COMMENT ON COLUMN "public"."lf_present_process"."node_id" IS '当前节点 id';
COMMENT ON COLUMN "public"."lf_present_process"."node_type" IS '当前节点类型（字典项 lf_node_type）';
COMMENT ON COLUMN "public"."lf_present_process"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."lf_present_process" IS '当前正在进行的流程';

-- ----------------------------
-- Records of lf_present_process
-- ----------------------------

-- ----------------------------
-- Table structure for lf_process
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_process";
CREATE TABLE "public"."lf_process" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 DEFAULT 0,
  "design_id" int8 NOT NULL,
  "title" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8 NOT NULL,
  "dept_id" int8,
  "post_id" int8,
  "data" jsonb,
  "release_id" int8 NOT NULL,
  "form_data" json,
  "status" int2,
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "cause" varchar(1000) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."lf_process"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_process"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."lf_process"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_process"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."lf_process"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."lf_process"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."lf_process"."design_id" IS '流程图 id（可以知道当前流程是基于什么原始设计运行的）';
COMMENT ON COLUMN "public"."lf_process"."title" IS '流程标题';
COMMENT ON COLUMN "public"."lf_process"."user_id" IS '流程发起人 id';
COMMENT ON COLUMN "public"."lf_process"."dept_id" IS '发起部门';
COMMENT ON COLUMN "public"."lf_process"."post_id" IS '岗位';
COMMENT ON COLUMN "public"."lf_process"."data" IS '流程实时数据(方便实时查看流程走向)';
COMMENT ON COLUMN "public"."lf_process"."release_id" IS '流程发布 id（可以知道当前流程是基于什么版本的设计在运行的）';
COMMENT ON COLUMN "public"."lf_process"."form_data" IS '流程运行过程中的所有表单数据';
COMMENT ON COLUMN "public"."lf_process"."status" IS '状态（1、流程进行中 0、流程已经完成 2、流程已归档 -1、流程中止）';
COMMENT ON COLUMN "public"."lf_process"."remark" IS '备注';
COMMENT ON COLUMN "public"."lf_process"."cause" IS '流程中止等原因';
COMMENT ON COLUMN "public"."lf_process"."type" IS '流程类型（字典项 lf_process_type）';
COMMENT ON COLUMN "public"."lf_process"."icon" IS '图标';
COMMENT ON TABLE "public"."lf_process" IS '流程管理';

-- ----------------------------
-- Records of lf_process
-- ----------------------------

-- ----------------------------
-- Table structure for lf_release
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_release";
CREATE TABLE "public"."lf_release" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 DEFAULT 0,
  "design_id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "data" jsonb NOT NULL,
  "version" int8 NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."lf_release"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_release"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."lf_release"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_release"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."lf_release"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."lf_release"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."lf_release"."design_id" IS '流程图 id';
COMMENT ON COLUMN "public"."lf_release"."name" IS '发布名称';
COMMENT ON COLUMN "public"."lf_release"."status" IS '状态(0 关闭 1 打开)';
COMMENT ON COLUMN "public"."lf_release"."description" IS '备注说明';
COMMENT ON COLUMN "public"."lf_release"."data" IS '数据（每个版本的数据）';
COMMENT ON COLUMN "public"."lf_release"."version" IS '版本号（yyyyMMddHHmmss）';
COMMENT ON COLUMN "public"."lf_release"."type" IS '流程类型（字典项 lf_process_type）';
COMMENT ON COLUMN "public"."lf_release"."icon" IS '图标';
COMMENT ON TABLE "public"."lf_release" IS '流程发布表';

-- ----------------------------
-- Records of lf_release
-- ----------------------------
INSERT INTO "public"."lf_release" VALUES (1976941568435253249, 1, '2025-10-11 17:22:54.373141', 1, '2025-10-11 17:22:54.373141', 0, 1968238470464376834, '请假流程.release.20251011172246', 1, '请假审批', '{"edges": [{"id": "e7b489a08442403f9b152354a066c666", "type": "custom-edge-line", "endPoint": {"x": -290, "y": -330}, "pointsList": [{"x": -370, "y": -330}, {"x": -290, "y": -330}], "properties": {}, "startPoint": {"x": -370, "y": -330}, "sourceNodeId": "4b4ed343e6bb46c4a5d93b1f80c3903d", "targetNodeId": "c5fc27d82cc148b9b1f578e03b91dceb"}, {"id": "fb78119e22594a66ae18ce43d869e141", "type": "custom-edge-line", "endPoint": {"x": -110, "y": -330}, "pointsList": [{"x": -190, "y": -330}, {"x": -110, "y": -330}], "properties": {}, "startPoint": {"x": -190, "y": -330}, "sourceNodeId": "c5fc27d82cc148b9b1f578e03b91dceb", "targetNodeId": "64f28d65b09849999052cb9075e693be"}, {"id": "d5fe54d720f1422b8525b0891450e865", "text": {"x": 0, "y": -330, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 50, "y": -330, "id": "-100--370"}, "pointsList": [{"x": -50, "y": -330}, {"x": 50, "y": -330}], "properties": {"condition": "SpEL", "expression": "!#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$"}, "startPoint": {"x": -50, "y": -330, "id": "-200--370"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "f9156ceea6b64afba948251df990c8fa"}, {"id": "14715d7893a14edcbc61aaf8c00e31bf", "text": {"x": -80, "y": -230, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": -80, "y": -180, "id": "-230--220"}, "pointsList": [{"x": -80, "y": -280}, {"x": -80, "y": -180}], "properties": {"condition": "SpEL", "expression": "#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": -80, "y": -280, "id": "-230--320"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "a1960c98cef541ec9736d2d0830a54ab"}, {"id": "1990705cc0694e42b94044cad6861125", "type": "custom-edge-line", "endPoint": {"x": 70, "y": -140, "id": "-80--180"}, "pointsList": [{"x": -30, "y": -140}, {"x": 70, "y": -140}], "properties": {}, "startPoint": {"x": -30, "y": -140, "id": "-180--180"}, "sourceNodeId": "a1960c98cef541ec9736d2d0830a54ab", "targetNodeId": "d256a21fdbf64171a50e84b9bfae6f1e"}, {"id": "b1169e25d3454e4bab53e81677a15c3e", "text": {"x": 175, "y": -140, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 220, "y": -140, "id": "70--180"}, "pointsList": [{"x": 130, "y": -140}, {"x": 220, "y": -140}], "properties": {"condition": "SpEL", "expression": "!#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$"}, "startPoint": {"x": 130, "y": -140, "id": "-20--180"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "00a4d5f8588c450aa0df7b3132677a6a"}, {"id": "2b21609bc3e14e6bb304e7668cbc0e66", "text": {"x": 100, "y": -40, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": 100, "y": 10, "id": "-50--30"}, "pointsList": [{"x": 100, "y": -90}, {"x": 100, "y": 10}], "properties": {"condition": "SpEL", "expression": "#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": 100, "y": -90, "id": "-50--130"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "bd986a38799f4c82b265170f359764d0"}], "nodes": [{"x": -420, "y": -330, "id": "4b4ed343e6bb46c4a5d93b1f80c3903d", "text": {"x": -420, "y": -331, "value": "提交请假申请"}, "type": "custom-node-start", "properties": {"fields": [{"key": "fe7329fc03a30431797da48b3cfbc4eb7", "name": "name", "sort": 0, "type": "STRING", "title": "姓名", "value": "", "disabled": false, "readonly": false}, {"key": "f884e56cbf5584885b77ed08aa66b165c", "name": "kind", "sort": "0", "type": "STRING", "title": "请假类型", "value": "", "disabled": false, "readonly": false}, {"key": "fb7f6bdd80a9040e79d0f64742b282c53", "name": "reason", "sort": 1, "type": "STRING", "title": "请假理由", "value": "", "disabled": false, "readonly": false}, {"key": "f3a5feb6e4e864e798b47b1e204f593f9", "name": "howLong", "sort": 2, "type": "NUMBER", "title": "时长", "disabled": false, "readonly": false}, {"key": "fe62e78c6f79e462db435526424aab7c7", "name": "timeUnit", "sort": 3, "type": "STRING", "title": "时间单位", "value": "", "disabled": false, "readonly": false}], "formBind": {"id": "1968242557142536193", "name": "请假流程开始表单.release.20250917171556"}, "documentation": "请假流程"}}, {"x": -240, "y": -330, "id": "c5fc27d82cc148b9b1f578e03b91dceb", "text": {"x": -240, "y": -330, "value": "小组长审批"}, "type": "custom-node-user", "properties": {"fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "userIdList": [{"id": "1963080001398505474", "name": "小组长"}], "autoExecute": false}}, {"x": -80, "y": -330, "id": "64f28d65b09849999052cb9075e693be", "text": {"x": -80, "y": -330, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 100, "y": -330, "id": "f9156ceea6b64afba948251df990c8fa", "text": {"x": 100, "y": -330, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": -80, "y": -140, "id": "a1960c98cef541ec9736d2d0830a54ab", "text": {"x": -80, "y": -140, "value": "领导审批"}, "type": "custom-node-user", "properties": {"roles": [], "fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "deptIdList": [], "userIdList": [{"id": "1963084850613714945", "name": "部门领导"}, {"id": "1963085401439076353", "name": "总经理"}], "autoExecute": false, "isCountersign": true}}, {"x": 100, "y": -140, "id": "d256a21fdbf64171a50e84b9bfae6f1e", "text": {"x": 100, "y": -140, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 270, "y": -140, "id": "00a4d5f8588c450aa0df7b3132677a6a", "text": {"x": 270, "y": -140, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": 100, "y": 60, "id": "bd986a38799f4c82b265170f359764d0", "text": {"x": 100, "y": 60, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowAlarmArchived", "success": true, "condition": "topic", "autoExecute": true}}]}', 20251011172254, 'normal', 'ep:avatar');
INSERT INTO "public"."lf_release" VALUES (1976941846643437569, 1, '2025-10-11 17:24:00.700696', 1, '2025-10-11 17:24:00.700696', 0, 1968238470464376834, '请假流程.release.20251011172349', 1, '请假审批（可选请假类型）', '{"edges": [{"id": "e7b489a08442403f9b152354a066c666", "type": "custom-edge-line", "endPoint": {"x": -290, "y": -330}, "pointsList": [{"x": -370, "y": -330}, {"x": -290, "y": -330}], "properties": {}, "startPoint": {"x": -370, "y": -330}, "sourceNodeId": "4b4ed343e6bb46c4a5d93b1f80c3903d", "targetNodeId": "c5fc27d82cc148b9b1f578e03b91dceb"}, {"id": "fb78119e22594a66ae18ce43d869e141", "type": "custom-edge-line", "endPoint": {"x": -110, "y": -330}, "pointsList": [{"x": -190, "y": -330}, {"x": -110, "y": -330}], "properties": {}, "startPoint": {"x": -190, "y": -330}, "sourceNodeId": "c5fc27d82cc148b9b1f578e03b91dceb", "targetNodeId": "64f28d65b09849999052cb9075e693be"}, {"id": "d5fe54d720f1422b8525b0891450e865", "text": {"x": 0, "y": -330, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 50, "y": -330, "id": "-100--370"}, "pointsList": [{"x": -50, "y": -330}, {"x": 50, "y": -330}], "properties": {"condition": "SpEL", "expression": "!#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$"}, "startPoint": {"x": -50, "y": -330, "id": "-200--370"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "f9156ceea6b64afba948251df990c8fa"}, {"id": "14715d7893a14edcbc61aaf8c00e31bf", "text": {"x": -80, "y": -230, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": -80, "y": -180, "id": "-230--220"}, "pointsList": [{"x": -80, "y": -280}, {"x": -80, "y": -180}], "properties": {"condition": "SpEL", "expression": "#node_c5fc27d82cc148b9b1f578e03b91dceb_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": -80, "y": -280, "id": "-230--320"}, "sourceNodeId": "64f28d65b09849999052cb9075e693be", "targetNodeId": "a1960c98cef541ec9736d2d0830a54ab"}, {"id": "1990705cc0694e42b94044cad6861125", "type": "custom-edge-line", "endPoint": {"x": 70, "y": -140, "id": "-80--180"}, "pointsList": [{"x": -30, "y": -140}, {"x": 70, "y": -140}], "properties": {}, "startPoint": {"x": -30, "y": -140, "id": "-180--180"}, "sourceNodeId": "a1960c98cef541ec9736d2d0830a54ab", "targetNodeId": "d256a21fdbf64171a50e84b9bfae6f1e"}, {"id": "b1169e25d3454e4bab53e81677a15c3e", "text": {"x": 175, "y": -140, "value": "不予批准"}, "type": "custom-edge-line", "endPoint": {"x": 220, "y": -140, "id": "70--180"}, "pointsList": [{"x": 130, "y": -140}, {"x": 220, "y": -140}], "properties": {"condition": "SpEL", "expression": "!#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$"}, "startPoint": {"x": 130, "y": -140, "id": "-20--180"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "00a4d5f8588c450aa0df7b3132677a6a"}, {"id": "2b21609bc3e14e6bb304e7668cbc0e66", "text": {"x": 100, "y": -40, "value": "准予通过"}, "type": "custom-edge-line", "endPoint": {"x": 100, "y": 10, "id": "-50--30"}, "pointsList": [{"x": 100, "y": -90}, {"x": 100, "y": 10}], "properties": {"condition": "SpEL", "expression": "#node_a1960c98cef541ec9736d2d0830a54ab_approve_$$historyId$$", "documentation": ""}, "startPoint": {"x": 100, "y": -90, "id": "-50--130"}, "sourceNodeId": "d256a21fdbf64171a50e84b9bfae6f1e", "targetNodeId": "bd986a38799f4c82b265170f359764d0"}], "nodes": [{"x": -420, "y": -330, "id": "4b4ed343e6bb46c4a5d93b1f80c3903d", "text": {"x": -420, "y": -331, "value": "提交请假申请"}, "type": "custom-node-start", "properties": {"fields": [{"key": "fe7329fc03a30431797da48b3cfbc4eb7", "name": "name", "sort": 0, "type": "STRING", "title": "姓名", "value": "", "disabled": false, "readonly": false}, {"key": "f884e56cbf5584885b77ed08aa66b165c", "name": "kind", "sort": "0", "type": "STRING", "title": "请假类型", "value": "", "disabled": false, "readonly": false}, {"key": "fb7f6bdd80a9040e79d0f64742b282c53", "name": "reason", "sort": 1, "type": "STRING", "title": "请假理由", "value": "", "disabled": false, "readonly": false}, {"key": "f3a5feb6e4e864e798b47b1e204f593f9", "name": "howLong", "sort": 2, "type": "NUMBER", "title": "时长", "disabled": false, "readonly": false}, {"key": "fe62e78c6f79e462db435526424aab7c7", "name": "timeUnit", "sort": 3, "type": "STRING", "title": "时间单位", "value": "", "disabled": false, "readonly": false}], "formBind": {"id": "1968263061492568065", "name": "请假流程开始表单.release.20250917183731"}, "documentation": "请假流程"}}, {"x": -240, "y": -330, "id": "c5fc27d82cc148b9b1f578e03b91dceb", "text": {"x": -240, "y": -330, "value": "小组长审批"}, "type": "custom-node-user", "properties": {"fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "userIdList": [{"id": "1963080001398505474", "name": "小组长"}], "autoExecute": false}}, {"x": -80, "y": -330, "id": "64f28d65b09849999052cb9075e693be", "text": {"x": -80, "y": -330, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 100, "y": -330, "id": "f9156ceea6b64afba948251df990c8fa", "text": {"x": 100, "y": -330, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": -80, "y": -140, "id": "a1960c98cef541ec9736d2d0830a54ab", "text": {"x": -80, "y": -140, "value": "领导审批"}, "type": "custom-node-user", "properties": {"roles": [], "fields": [{"key": "f78a4356b26964ed4901f6b5e7a0ce2fe", "name": "approve", "sort": 0, "type": "STRING", "title": "是否批准", "value": "", "disabled": false, "readonly": false}, {"key": "f1e8d0c1daf6a475295655e23884f0e45", "name": "reason", "sort": 1, "type": "STRING", "title": "理由", "value": "", "disabled": false, "readonly": false}], "approved": false, "formBind": {"id": "1968260048388460545", "name": "是否审批通过表单.release.20250917182529"}, "deptIdList": [], "userIdList": [{"id": "1963084850613714945", "name": "部门领导"}, {"id": "1963085401439076353", "name": "总经理"}], "autoExecute": false, "isCountersign": true}}, {"x": 100, "y": -140, "id": "d256a21fdbf64171a50e84b9bfae6f1e", "text": {"x": 100, "y": -140, "value": "条件判断"}, "type": "custom-node-judgment", "properties": {"approved": false, "autoExecute": false}}, {"x": 270, "y": -140, "id": "00a4d5f8588c450aa0df7b3132677a6a", "text": {"x": 270, "y": -140, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowProcessAutoDealReject", "success": false, "condition": "topic", "autoExecute": true}}, {"x": 100, "y": 60, "id": "bd986a38799f4c82b265170f359764d0", "text": {"x": 100, "y": 60, "value": "结束"}, "type": "custom-node-end", "properties": {"topic": "flowAlarmArchived", "success": true, "condition": "topic", "autoExecute": true}}]}', 20251011172400, 'normal', 'ep:avatar');

-- ----------------------------
-- Table structure for lf_release_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_release_permissions";
CREATE TABLE "public"."lf_release_permissions" (
  "id" int8 NOT NULL,
  "release_id" int8 NOT NULL,
  "user_id" int8,
  "dept_id" int8
)
;
COMMENT ON COLUMN "public"."lf_release_permissions"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_release_permissions"."release_id" IS '流程发布 id';
COMMENT ON COLUMN "public"."lf_release_permissions"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."lf_release_permissions"."dept_id" IS '部门id';
COMMENT ON TABLE "public"."lf_release_permissions" IS '流程发布权限表，用于关联指定流程，可以被哪些角色或者用户看到';

-- ----------------------------
-- Records of lf_release_permissions
-- ----------------------------
INSERT INTO "public"."lf_release_permissions" VALUES (1976941568498167809, 1976941568435253249, 1, NULL);
INSERT INTO "public"."lf_release_permissions" VALUES (1976941846706352130, 1976941846643437569, 1, NULL);

-- ----------------------------
-- Table structure for lf_todo
-- ----------------------------
DROP TABLE IF EXISTS "public"."lf_todo";
CREATE TABLE "public"."lf_todo" (
  "id" int8 NOT NULL,
  "node_id" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" int8,
  "user_id" int8,
  "dept_id" int8,
  "create_time" timestamp(6),
  "process_id" int8 NOT NULL,
  "status" int2 NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default",
  "todo_status" int2,
  "done_status" int2,
  "design_id" int8,
  "todo_type" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."lf_todo"."id" IS '主键';
COMMENT ON COLUMN "public"."lf_todo"."node_id" IS '节点 id';
COMMENT ON COLUMN "public"."lf_todo"."role_id" IS '角色 id';
COMMENT ON COLUMN "public"."lf_todo"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."lf_todo"."dept_id" IS '部门id';
COMMENT ON COLUMN "public"."lf_todo"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."lf_todo"."process_id" IS '流程 id';
COMMENT ON COLUMN "public"."lf_todo"."status" IS '状态（1、待办、0、已办）';
COMMENT ON COLUMN "public"."lf_todo"."type" IS '流程类型（字典项 lf_process_type）';
COMMENT ON COLUMN "public"."lf_todo"."todo_status" IS '待办状态（1、待处理 2、待阅 3、驳回）';
COMMENT ON COLUMN "public"."lf_todo"."done_status" IS '已办状态（这个可以行写自动处理 bean 去自定义状态）';
COMMENT ON COLUMN "public"."lf_todo"."design_id" IS '流程图 id（这里主要是用来查询分类，不用发布 id，是因为发布有版本限制不同版本的 发布 id 是不一样的，但是类型是不变的）';
COMMENT ON COLUMN "public"."lf_todo"."todo_type" IS '待办类型（1、任务待办 2、抄送待办 ...其他类型自定义）';
COMMENT ON TABLE "public"."lf_todo" IS '待办、已办';

-- ----------------------------
-- Records of lf_todo
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_authorization
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_authorization";
CREATE TABLE "public"."oauth2_authorization" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "registered_client_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "principal_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "authorization_grant_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "authorized_scopes" varchar(1000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "attributes" varchar COLLATE "pg_catalog"."default",
  "state" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "authorization_code_value" varchar COLLATE "pg_catalog"."default",
  "authorization_code_issued_at" timestamp(6),
  "authorization_code_expires_at" timestamp(6),
  "authorization_code_metadata" varchar COLLATE "pg_catalog"."default",
  "access_token_value" varchar COLLATE "pg_catalog"."default",
  "access_token_issued_at" timestamp(6),
  "access_token_expires_at" timestamp(6),
  "access_token_metadata" varchar COLLATE "pg_catalog"."default",
  "access_token_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "access_token_scopes" varchar(1000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "oidc_id_token_value" varchar COLLATE "pg_catalog"."default",
  "oidc_id_token_issued_at" timestamp(6),
  "oidc_id_token_expires_at" timestamp(6),
  "oidc_id_token_metadata" varchar COLLATE "pg_catalog"."default",
  "refresh_token_value" varchar COLLATE "pg_catalog"."default",
  "refresh_token_issued_at" timestamp(6),
  "refresh_token_expires_at" timestamp(6),
  "refresh_token_metadata" varchar COLLATE "pg_catalog"."default",
  "user_code_value" varchar COLLATE "pg_catalog"."default",
  "user_code_issued_at" timestamp(6),
  "user_code_expires_at" timestamp(6),
  "user_code_metadata" varchar COLLATE "pg_catalog"."default",
  "device_code_value" varchar COLLATE "pg_catalog"."default",
  "device_code_issued_at" timestamp(6),
  "device_code_expires_at" timestamp(6),
  "device_code_metadata" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."oauth2_authorization" IS '登录管理-记录各个 token 的状态，刷新 token 的在线状态 信息等';

-- ----------------------------
-- Records of oauth2_authorization
-- ----------------------------
INSERT INTO "public"."oauth2_authorization" VALUES ('cd564c93-8146-47ca-a095-1d056e7f6d28', '1', 'root', 'taybct', 'all', '{"@class":"java.util.Collections$UnmodifiableMap"}', NULL, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjMwMTY5ZGFmMWViNDQ0ODg4NjlhM2M3YmQwODY2MTk2Iiwia2lkIjoiODRlODlkMTc0ZGQ3NDQ2YjgzZTQxMGNjZmM0MGM2OGUifQ.eyJ1aWQiOiIxIiwibmJmIjoxNzg5ODY5NTM5LCJncmFudF90eXBlIjoidGF5YmN0IiwidXNlcl9uYW1lIjoicm9vdCIsInNjb3BlIjpbImFsbCJdLCJhdG0iOiJ1c2VybmFtZSIsImV4cCI6MTc4OTg3MzEzOSwiaWF0IjoxNzg5ODY5NTM5LCJqdGkiOiIxMTk3NTNlYS0yODg5LTQ0YzgtOGQ3NC0wNWQ2OGNjZWFlMTgiLCJjbGllbnRfaWQiOiJ0YXliY3RfcGMiLCJhdXRob3JpdGllcyI6WyIwMDAwMDA6Uk9PVCJdfQ.X4q191mxFnEYMrVKV0NQmjLK9Ceh4gVpO-ljmntU6NFXz1hngEPR6WAQfYnLXgM5Zf8FknW4DXhhMpt-Cnh2yl7mGKsXW1njmV4-VpGzHYnpErfb4Vc4OjhOuvnxljOF6hA3JCNgq0t9dfJqew1kmYN1eFuIDJYTp4SGOzo-qws20vD0ZZ6tcN25nBLTDjJdn9l2c49dFGBVfA7JG4CKN5JWYmsniaMxsJyqqRbzoFgZPr-W2Ev9vMtwpjBBmOhY0Yu25uRKhsS0tCJlz49BFrkhN7-19tDb7xgiySmwXj3gBHcjFntRKhj9HsYvZryRe2s0686hijaBeYurdrYknQ', '2026-09-20 09:58:59.309587', '2026-09-20 10:58:59.309587', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.claims":{"@class":"java.util.Collections$UnmodifiableMap","uid":"1","nbf":["java.time.Instant",1789869539.309587300],"grant_type":"taybct","user_name":"root","scope":["java.util.Collections$UnmodifiableSet",["all"]],"atm":"username","exp":["java.time.Instant",1789873139.309587300],"iat":["java.time.Instant",1789869539.309587300],"jti":"119753ea-2889-44c8-8d74-05d68cceae18","client_id":"taybct_pc","authorities":["java.util.ArrayList",["000000:ROOT"]]},"metadata.token.invalidated":false}', 'Bearer', 'all', NULL, NULL, NULL, NULL, 'vtUZhaBBL0dMDwWraB81wFDvDo78c7_uwtAacaKTJMZBsEDgrQQSTfmjLpxuCEE0G40yZXVeEdGBgWxapQS3yjel68M3edtTEawXDqv6H_5Ho6MBBLKqqzxSh90-WcxG', '2026-09-20 09:58:59.391873', '2026-09-21 09:58:59.391873', '{"@class":"java.util.Collections$UnmodifiableMap","metadata.token.invalidated":false}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oauth2_authorization_consent
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_authorization_consent";
CREATE TABLE "public"."oauth2_authorization_consent" (
  "registered_client_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "principal_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "authorities" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON TABLE "public"."oauth2_authorization_consent" IS 'oauth2 授权管理表';

-- ----------------------------
-- Records of oauth2_authorization_consent
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_registered_client
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_registered_client";
CREATE TABLE "public"."oauth2_registered_client" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "client_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "client_id_issued_at" timestamp(6) NOT NULL,
  "client_secret" varchar(200) COLLATE "pg_catalog"."default",
  "client_secret_expires_at" timestamp(6),
  "client_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "client_authentication_methods" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "authorization_grant_types" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "redirect_uris" varchar(1000) COLLATE "pg_catalog"."default",
  "scopes" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "client_settings" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "token_settings" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "post_logout_redirect_uris" varchar(1000) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."oauth2_registered_client" IS 'oauth2 客户端表';

-- ----------------------------
-- Records of oauth2_registered_client
-- ----------------------------
INSERT INTO "public"."oauth2_registered_client" VALUES ('1', 'taybct_pc', '2023-01-03 10:14:24', '$2a$10$MOJpMmMoEcgQ.dMobC294uakWMSB68bw.vOifVq/YzwbRvf/MbQja', NULL, 'taybct_pc', 'client_secret_basic', 'taybct_refresh,refresh_token,password,client_credentials,authorization_code,taybct,sms,wechat_qr_code,pki', 'https://www.baidu.com', 'all', '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":false}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",86400.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",300.000000000],"settings.token.device-code-time-to-live":["java.time.Duration",300.000000000]}', '');
INSERT INTO "public"."oauth2_registered_client" VALUES ('1947936658897342465', 'test', '2025-07-23 16:27:45.498924', '$2a$10$BHWwbuqCvSdTCno9LBPI.OqsUDo4L8Ac8HqUoLbutGXif5uZy.5s6', NULL, 'test', 'client_secret_basic', 'code', 'https://www.baidu.com', 'all', '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":false}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",604800.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",300.000000000],"settings.token.device-code-time-to-live":["java.time.Duration",300.000000000]}', '');

-- ----------------------------
-- Table structure for scheduled_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."scheduled_log";
CREATE TABLE "public"."scheduled_log" (
  "id" int8 NOT NULL,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default",
  "task_key" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "params" text COLLATE "pg_catalog"."default",
  "message" text COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "exception_info" text COLLATE "pg_catalog"."default",
  "start_time" timestamp(6) NOT NULL,
  "stop_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6),
  "uni_key" varchar(64) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."scheduled_log"."id" IS '主键';
COMMENT ON COLUMN "public"."scheduled_log"."tenant_id" IS '租户id';
COMMENT ON COLUMN "public"."scheduled_log"."task_key" IS '任务键';
COMMENT ON COLUMN "public"."scheduled_log"."description" IS '任务描述';
COMMENT ON COLUMN "public"."scheduled_log"."params" IS '任务启动参数';
COMMENT ON COLUMN "public"."scheduled_log"."message" IS '日志信息';
COMMENT ON COLUMN "public"."scheduled_log"."status" IS '状态(1 正常 0 失败)';
COMMENT ON COLUMN "public"."scheduled_log"."exception_info" IS '异常信息';
COMMENT ON COLUMN "public"."scheduled_log"."start_time" IS '任务开始执行时间';
COMMENT ON COLUMN "public"."scheduled_log"."stop_time" IS '任务结束执行时间';
COMMENT ON COLUMN "public"."scheduled_log"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."scheduled_log"."uni_key" IS '唯一键';
COMMENT ON TABLE "public"."scheduled_log" IS '调度日志';

-- ----------------------------
-- Records of scheduled_log
-- ----------------------------

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
  "parent_run_id" varchar(255) COLLATE "pg_catalog"."default",
  "execution_time" int8
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
COMMENT ON COLUMN "public"."scheduled_log_centralized"."execution_time" IS '执行耗时（毫秒）';
COMMENT ON TABLE "public"."scheduled_log_centralized" IS '定时任务控制台日志管理';

-- ----------------------------
-- Records of scheduled_log_centralized
-- ----------------------------
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641530036695042, '2026-07-27 15:23:00', 'ac687e46-8702-4d05-82aa-e15eeeabf41d', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:23:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:23:00：[INFO] 任务描述：接口调度02
2026-07-27 15:23:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:23:00：[WARN] lock dev%40%40module-system conflict;retry time: 1
2026-07-27 15:23:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:23:10.329327', NULL, 137);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641530036695044, '2026-07-27 15:23:00', '49b95b79-beb6-4537-b0c6-38decde52dab', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:23:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BOHzyCv/uF9kN9FsjGgkK/ttSbey6VhnjLSKqQmvibM81xbDf1gr5v9oVXUfIA596Hi2G6ZDLo6G5fHpV++/i7Yff5nHY5O7N0Ik9XORKNF2HoZoo+I3DVL3/dDf11ubJe0mWrReg0QhUK/MC0PPQfjsbsFZS/lNWm2gpd24/8FkXiwdVTLNsEl+493I/7MJGQxHThd69MA1D+HtE82dxwRW3lneJIaPf7ELyWA2hNmugM9gEuaf0FBQAfyiVEWiQgMctwNyWFbSZgONXlNEO0XKXU7HkxFzcjmiyEEr134THQcBVfp2POJGwglOi6aLCt1Ig84ftb7MLzPyCzV6JT/xEJ+Nja0KzxVk3ITzk3H3CxT4Jl2HrWeYEgvVc2M9maUulYKmoolid9V7teOC+HEPEaSZE/+zfroLVPXjJ5O1Uc0Oxe5YRzHzU1rdy1S4jE8r
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 49b95b79-beb6-4537-b0c6-38decde52dab
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ac687e46-8702-4d05-82aa-e15eeeabf41d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:23:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:23:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (15 ms)
================  Response End   ================

', '2026-07-27 15:23:10.329327', 'ac687e46-8702-4d05-82aa-e15eeeabf41d', 60);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642534916435971, '2026-07-27 15:27:00', '35210415-0c4a-4326-a7f6-486209f8751d', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:27:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-07-27 15:27:00：[INFO] 任务描述：接口调度01
2026-07-27 15:27:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:27:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:27:10.03063', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642786528538626, '2026-07-27 15:28:00', '0483045c-e25e-4d1e-9d9e-c1f9649f39c4', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:28:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BM1MbLz6CNq1050Xi9XMHP1ok19H7JdZKPLRRev22W1o/GqGOsA2ird1uayHRHJLi7lLHkMahm8jU0CuiWtcQ2uPp9iwOVUtpb4QlDL+CaC5qDsJDTm9Z2PAZznbBUrPdqL0bho3hel9hQY7RNK6kT5cS6T180kLWNBoB5+BvaTtg2B0oHNRKcGS89TjL9k+J8qTz9ExsoVEwmxb3KUy92IZBQ8jv8slVSdesb7pip0RrL7GmZY/vj3R4g2jfB78vU1yPexNnXqJsTgUjnI+reOMQ3B2WqtAu3vVtdHMyioMfjNM9C6vsqsDSJv+2GhPZ6P6/yrmuyXlY/oMmqqFo2bnakG5O9wBkunLQniIm67fYcxqFMgXhazYEvbhjeK3HzQBmFzocIgioWEd2zMFJZqKJHVO0pcSeYZXz3uynyg++OS9BOyKvhPokFP5lQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 0483045c-e25e-4d1e-9d9e-c1f9649f39c4
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : de427121-9c5b-4ac5-aac0-cb038e5b7539
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:28:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:28:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:28:10.019022', 'de427121-9c5b-4ac5-aac0-cb038e5b7539', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642786528538627, '2026-07-27 15:28:00', '70cbc008-77a9-4ffe-becb-3c78f4dfce0b', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:28:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BAktV3PFV9dNks80XVMrZ/08+HmzcmsLFlCanEqQndIY/BowqbQrHsNBuvQo5AAmt4E/d+gbFN8QtD1uoIGngMEvle5TULUnM9kesLV8C6rb/cXuOhQHl5/GMBdbBbVQSygs7DrZEkOadS3YytI4hl3wGvvKAo1uevBnitD+wpBSPcbIMQ/ZIjihViwV0KkhjPipI3Ys3LeBnolrZAJhM4r710LBEcDjKyXVj8xFhSsi6dr6R94CtPgq4KCbdap+e1TuvJstxeF6g5nqBT6vIoe8FLxtRHd/aYEooOrQldRzFlC5/49nOUulOXo1pul3LY8NpOpNlvs5YVSrb/ypjqMNkfIr7XdZaM/JVs/jg17whFyAlBlZcVnrEdWXxgxzmZOwJBV73z9asjgx9xfG0AjM93Uh9tJ1XCeky2hnNi5dZ7L5FVkI1IMh4NyAG3glkVje
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 70cbc008-77a9-4ffe-becb-3c78f4dfce0b
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 15bf6696-2d4d-4b28-9283-44622855fdb3
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:28:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:28:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:28:10.028865', '15bf6696-2d4d-4b28-9283-44622855fdb3', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642786591453187, '2026-07-27 15:28:00', '15bf6696-2d4d-4b28-9283-44622855fdb3', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:28:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-6 
2026-07-27 15:28:00：[INFO] 任务描述：接口调度02
2026-07-27 15:28:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:28:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:28:10.033398', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643038325190658, '2026-07-27 15:29:00', 'ca154ba4-1f45-4f63-b347-c8c3bbc540f2', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:28:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-07-27 15:28:59：[INFO] 任务描述：接口调度01
2026-07-27 15:28:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:29:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:29:10.051459', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641530036695043, '2026-07-27 15:23:00', '63bdb832-7f10-484d-9e20-7b5258a39a1f', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:23:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BOVzHVcfaJvmI3zIruMp3+fMzaTpjD5WxETx7mvnqyLEwDAjSuuTYVbLGSZQAPfMM4FHLJ+txHirxYMc280ZpaM9w+SCB+tn+ijMOx0Bx1P/KDArJbjECt6uQPPplNqSpY+grzcotAG7dWIAfuZFr18k7NnW7jOTPheyvLZU8UTxhFDu5PBZeHkghaQIxuyGJQovEAWNCyi1gj8o4Snz+JRbgkznkTkqJiRt201M5c+KFB1gpKRkh/Mv9VFmXrxZ370ifRkJ9sd8+1bRB0BRwItQe1IJ1MbvHV8lfyQ/nxcO5NZv6hn6cG5zIMq7GD5GhyjwKHq9thXdrBa76asQbwFcP+4c4m2R9Wkad4ANqMM79LOm8W7CZZNw52ITU+RQ6QPGVk9OtQ+odD7QtCwzk4hh5M9y3xx4mO0iv3QM8Ex/MRT6mUXsDTIqz2LB4w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 63bdb832-7f10-484d-9e20-7b5258a39a1f
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : dffd7de2-db8d-47dc-b666-970f7bbd857b
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:23:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:23:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (15 ms)
================  Response End   ================

', '2026-07-27 15:23:10.329327', 'dffd7de2-db8d-47dc-b666-970f7bbd857b', 44);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641779945910274, '2026-07-27 15:24:00', 'ffb36218-3492-49c6-bb7f-98de74c1d2eb', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:24:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BFwqytvH9zNRhxenogdr+2pMfKFPsgCyZPQZ56OXElGeKIUnWTb7Vd+6+ZmNuTw5fWDd+ueqZA4Sm7GFxbZ4NaJG1TiSzz1lp9pZL6byYiKmoq9y/CEkHVaJVXdWsYvmG1apoEf4tt1AHDVlXErwXENdAZjayQcfan24eAmJvt5P2JiYKM7D71S83ihPuJ3zqZu3cDfoe/JFJtRivlzCsIN6ni4kNLkAuKLX/Vay2+v2xDmZZxrWW/7X0zSA7jsnd6cSVw0inriC5zlWdIh+HRl+jMw4T/r7GYPZhGc9HKx3WhdcCswU0ztoxPKSzCWLOjurKpLanModZn8oFHJOEZdvz1aHngUsCAKNIX0GWUnsm/5Q4GGRufTf2BjfEEUpY/PWfQGW5IyW7sWqkyF3NrfOsSS1PjoBEAU7p8uz/CBWD9tAiiSlj0rX12JR/w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : ffb36218-3492-49c6-bb7f-98de74c1d2eb
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 81feb93f-d56c-4e9f-b981-b23d9e2c884d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:24:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:24:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-07-27 15:24:10.031458', '81feb93f-d56c-4e9f-b981-b23d9e2c884d', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641779945910275, '2026-07-27 15:24:00', 'ae53cc8a-4442-4cf9-82db-a2fea8f22af8', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:24:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:24:00：[INFO] 任务描述：接口调度02
2026-07-27 15:24:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:24:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:24:10.037461', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642031578984450, '2026-07-27 15:25:00', 'dfdd0d64-ff21-4d3f-be75-824809f8b593', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:25:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BPPD0qp+S5vkCQkKxJaO0zaEXQSzWX7n3NRbwLhG/u1meFvDuCwVgvcbetJCaBmyoNTRmXIkjXLHuMjUYO9sdZJfPuLORy09Up4D6CyyfwvcZdXV9n76WMM05eooIWF26m8snXZGi1Hp9cXkNsfyFbDMM+lC09mL2+Lo08cwO9tVhjbZnMGkCCdynmcHr1hAk1n/iKBpnAwg+eXeD17GqbawH+VKmNEesFRYyVjNaPZohgt0/LhUR5RxofpplRG6cTeGJHMgbdHvBwxgHLpWrHf3X7Uhe+nvv53M7PW49AIRZZmhHdEUkuhGq2C3jW+meHvCBkegkrY/D3q54co2SVqC2tGclZjoAFaR/ek0bGaqhQsTRztEKtjT5Gloa7lIml11joAYSTYXDK4oP8cRygFjD63BEt0Dg5PQm27Qjj6O6PHldwAAxMgygkrSY2D42BJv
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : dfdd0d64-ff21-4d3f-be75-824809f8b593
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 5886ca1a-cf28-4a2a-b2e3-b9258c806781
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:25:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:25:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:25:10.024971', '5886ca1a-cf28-4a2a-b2e3-b9258c806781', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642031578984452, '2026-07-27 15:25:00', 'f54cc7d6-ad44-4cb1-b61c-bf3412c9cc99', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:25:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-3 
2026-07-27 15:25:00：[INFO] 任务描述：接口调度01
2026-07-27 15:25:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:25:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:25:10.032611', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641779945910273, '2026-07-27 15:24:00', '22d220fc-44c2-42e9-850e-ca1ec47ac7bb', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:24:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BD0ceFQP2HQfitLf+l8MFfsnwGDLMIC+7ymDGjaojW1LveNp1xDsbeNfgLRLpCUW0q3DwtKP5S1ZV3SD7Lrb/9iQTyH/aDg7kvmTkTXIOG55VbkchIadT9n+FYDMI0juXiMnCT2ZNHDTKf1FmKty3keaFT7b3TiqI3/CH072Qecrj/EMXd96m6K3h43U30jzW9TEB0XwsiWWPreYtzdMaHYdB4QrCPTH3N6p24c04cffaVQyngqOPq452P2zW21fsBY+JLxO4sFXe75fRKgOrj+8o6/ToB5WR8zCdw73mkLzXZ9xStM4QNtYxfTlQES29YsoRJTAX9B+OTjTPF5VvDR6zxVrrI4p6O+o2ZMsJY2jaqSL4LX8Ujzu5PagDAjZQvZW5y5v4Drc19Mw7s2o9ppyRQGLJ6giiSHnD+XJYSUVmCpNm4KnQkeGFGXR7ID2B8KE
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 22d220fc-44c2-42e9-850e-ca1ec47ac7bb
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ae53cc8a-4442-4cf9-82db-a2fea8f22af8
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:24:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:24:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:24:10.031458', 'ae53cc8a-4442-4cf9-82db-a2fea8f22af8', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641779945910276, '2026-07-27 15:24:00', '81feb93f-d56c-4e9f-b981-b23d9e2c884d', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:24:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-07-27 15:24:00：[INFO] 任务描述：接口调度01
2026-07-27 15:24:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:24:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:24:10.037461', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642031578984449, '2026-07-27 15:25:00', '2cf5dc1a-c499-413c-b721-bb4fcdb99c16', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:25:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BC0k0njF9NuJLJjEXnhh8odF8hVv9a471vAwbXmd0VUcBEEI+WRdr1g8pfN28JffjoeJrJVJEVxTVe/QTfYByzA+FjriNYc2tCAZ7NBaEXGg6qe6MDB+Ayz9rWSTmHGyeMTPAcnpku9YkysmcHliw56fkDw+GiRoGW12h6ztN12d0b3JVAIWcKRB+5wIAjnBeI2+OO2wQuXMLOxdSLkwHyO4uSgCLAhirm8t1D0apyDUMCAXa1Y0AHGbvVKH32JOkoS3EIaNn1bj9ccwb9fhv+iT23NimhHN5HQUdiTRBOoQXB7lNdU0+xUiudijN7GP24HsA0BXAOF7GxeVsEPdiJqYKUklXB6+38y5PIp0KrdOwLrrJswsppNVJ7zs066feOH5uAaB0+nzI5HCOFtFPaR3FkFJLzWchntb3l+zTLs90hT+Z0zZCyVdW8xz0Q==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 2cf5dc1a-c499-413c-b721-bb4fcdb99c16
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : f54cc7d6-ad44-4cb1-b61c-bf3412c9cc99
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:25:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:25:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:25:10.024971', 'f54cc7d6-ad44-4cb1-b61c-bf3412c9cc99', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642031578984451, '2026-07-27 15:25:00', '5886ca1a-cf28-4a2a-b2e3-b9258c806781', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:25:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:25:00：[INFO] 任务描述：接口调度02
2026-07-27 15:25:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:25:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:25:10.032611', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642283241418753, '2026-07-27 15:26:00', 'f2f96626-3296-452b-b9bf-7acbeb98c0ba', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:26:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BPjP+HhQLxKgu0OGGDbLBjUOVwiSVwoAOs344IJuuy/iRiBujJlKFrkd5816VW6yajC1AXwNjLvG+M0zKzJXKeLop/JOcACJIulcWujQws0yYKCGbVkh5rlzGaPmKMlJsmHRDjC6AsXrUfAR/YAKs6jG5qk/lt7wiMfQD6l7WIrn2E/TGenre0iZR9IfFMGylQb3vK0zu+B8SOZFjB9gyUSujGJRjJvNb3yZiSTv/91gtWrgWPJXyS6JLue+MXGD9JtquTnl0GAgQLEsf59OB4Jp1oQ0HbCa1fjoVnGEAykkpKrpM0A393jcFdNNaOiRvh+TISLgJmBxyQugBb+9SgBcdWY+S5ZY4vhkHzl6X4OC7wijQoBI2y3mWsYH23n2eTLVuVmk6SLIOR0q8XqxhCqnkUDZjmBoP3pQyYnHhp929Oqd3Dt4Oy1LuTGl4w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : f2f96626-3296-452b-b9bf-7acbeb98c0ba
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 1a7fc2d9-ae74-4435-8929-018438553f1f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:26:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:26:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:26:10.026006', '1a7fc2d9-ae74-4435-8929-018438553f1f', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642283241418756, '2026-07-27 15:26:00', '1a7fc2d9-ae74-4435-8929-018438553f1f', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:26:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-07-27 15:26:00：[INFO] 任务描述：接口调度01
2026-07-27 15:26:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:26:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:26:10.034021', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642283241418754, '2026-07-27 15:26:00', '4d890307-2c5e-4d0d-9c7f-2aa2241e36e6', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:26:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BEzns8y6IerAfBUfYxibU+Dp18PdcOTIS9RbQ50cLc1mMHugixZhIwudiVV6wre6hRGETPB2fMFPJLWni7uw5+jstgAWDhKK7OYAsWqS5I6BcTQNGnyAZ09qykKaf92fcN4AQUF5KDjpYrzIcUwCwFSN97jZ/mTwuLjvIlIHE+hQF9GZV8TncbEKz7w5ieb4opNER+If35d9Ak4ORQi3FJNKDJLAetyqlV/+rokMk5haCjaaWsa31uLnw94l4mdNQn2QdeEx5BgTDmMTTBzc7pgEsqXoGKyuPFPPAs+6wYidYZt705b+v4Q7E/+fShM7/z9hpYNhqm9PLSaP/n/PGBSfF0Gij3xL7teORqbvPFEBmMPkXVZlMgOlrEitZqPSJAAxEhAtvxxfoJmohd2h+WMooZYf1PQNVguJaRQfdxaVJt5VWEaJZe068TH0XGIZu1XR
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 4d890307-2c5e-4d0d-9c7f-2aa2241e36e6
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 4b034695-9ecb-421a-b08d-50b07389360d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:26:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:26:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:26:10.026006', '4b034695-9ecb-421a-b08d-50b07389360d', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642283241418755, '2026-07-27 15:26:00', '4b034695-9ecb-421a-b08d-50b07389360d', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:26:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-07-27 15:26:00：[INFO] 任务描述：接口调度02
2026-07-27 15:26:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:26:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:26:10.034021', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642534916435970, '2026-07-27 15:27:00', '281bb32b-7527-4e2e-862f-2f5ab3d22852', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:27:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-07-27 15:27:00：[INFO] 任务描述：接口调度02
2026-07-27 15:27:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:27:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:27:10.03063', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643541511647235, '2026-07-27 15:31:00', 'ff06b699-a82f-4d86-825e-8270b2113edd', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:31:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-07-27 15:31:00：[INFO] 任务描述：接口调度01
2026-07-27 15:31:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:31:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:31:10.023657', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642534916435972, '2026-07-27 15:27:00', '7c8ec7ad-18a7-4b41-a9f4-6b6cb437ddfc', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:27:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BEv9fmCCFLTsm8cZeyQhgAn7vJO6qHvXc7YRHyWVI4qVjDk9IDhInstQG/T4ozgrObyoednU/xKfQODdb1smcCFc4+zxsEtHDkoarlPgL7BZ0O6HzWmhtH+g/AfFAZzMkG292SHK9gcODAS9AvJ1shjkXTTahq2brbCQMOg9eqvSKX348xpKc37HDxZVmj8PPxN6Dd5B14O/DOGAL4n50ckp9PrP4fxIsyzuVmjucGMjir5Y4F+ERp2dpkBVowkzIo0yAbwqfyLJqwtQInpHQB2eDb1lbi5RnOHsL0PAytMGweF+XT4yaASPFJSgHrFH25V8TDfjnTzfKXHzonuAtmFfowyjbsyZTUxg2p1hikZvyPyjxEpgvro62bPU26LzwIg5g/ZtYjHqamY6je+kN5A86c6j6qrMOj0reUNqPU4lNutf5wTv7ztiAbXCpQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 7c8ec7ad-18a7-4b41-a9f4-6b6cb437ddfc
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 35210415-0c4a-4326-a7f6-486209f8751d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:27:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:27:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:27:10.03063', '35210415-0c4a-4326-a7f6-486209f8751d', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642786591453186, '2026-07-27 15:28:00', 'de427121-9c5b-4ac5-aac0-cb038e5b7539', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:28:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-07-27 15:28:00：[INFO] 任务描述：接口调度01
2026-07-27 15:28:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:28:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:28:10.033398', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643038195167234, '2026-07-27 15:29:00', '930ea998-95b3-4c8e-b24f-b5b1436f4125', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:29:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BIVeyMeiG3+t+vNsz9+/k9DFqK5fjr63MEAPAcv6MfOLayMfegnGlAXeYyjlQj4+sYJIwyo1yO1ATCtIIdS7a/+1aZvpcYbqwWyBldnCr45i/zMcTrCnu8BxVyvsJRqYMwshwX1Cbew+fzBd5xJWeaZ+jd0vgRe1zSrPqEByV5zgXFMvvtkwtCgu681s3wj51Cfg42YNYagXdOeh7c4RcOCHWVgKxtyL4zCQF/smcJSu++GFq6SWlcuaom5/2DMqFPfLnBWtXZat17uxKDMAbXb9IZxW4Ek5N9NLR4eOKOweBg7b2W0ab3Wp4MDQ2XpWXNl24TdHMw7M5AnfTtYsWjgmXpYYn3WZ/TcqW0GezXFR2rG5RBFqgIA5AduWsia3StFD9enmDKzT1W+ILu9jvDrr1HU37krE/TP+23F2RD8aLy3T/Dk3F1QSISmi/A==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 930ea998-95b3-4c8e-b24f-b5b1436f4125
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ca154ba4-1f45-4f63-b347-c8c3bbc540f2
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:29:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:29:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:29:10.021163', 'ca154ba4-1f45-4f63-b347-c8c3bbc540f2', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643038258081793, '2026-07-27 15:29:00', '39a401d2-f36a-44c8-8d57-58659dd29daf', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:29:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJ2Mt13y0WkSeCLKNInIMVn/a+Kf+O+UX0FnGiMys+BiSj2X24Pdp0g1HCZG/UI0pvw2ZqFPfyGGSNO5Ivyz60O6l96n5naX00FabYcEE1Hvh7AmnlrJxtWC10FBS8gYqEeaqp2N7rg4qUyPo0ZtT73hkVWXBK5/S1rKQQMzyx0OrxsmlP5HRiHz5pECg7bZl+oXaJ6Bod6SOxdfFtKjF/2uDqbRlP4Y1Hrgobk8/AOrj82PKiTW4LRAOeo3DXDLdJnKhCMbb9drByH9fRF2iZGSz4DY5ndFDa5+7Xj/kTdtbx7/k21sn7dMebz34HXkBeAszxhc47WdEZ/Mcsh0FRd9ZxjQR2AsMSCPsvSI8TmAxWG14yCRlG3FnndwLBE1Kx1Nb3+Jd/R+bbaO1HHkZqZQbeXM2Ib0s+j79R2775FstolUCFYiKhEFyrxM5Hc2R1Zm
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 39a401d2-f36a-44c8-8d57-58659dd29daf
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 8e023b95-0932-4b3f-8ec1-cee1ce3e864c
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:29:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:29:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:29:10.036488', '8e023b95-0932-4b3f-8ec1-cee1ce3e864c', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643038325190657, '2026-07-27 15:29:00', '8e023b95-0932-4b3f-8ec1-cee1ce3e864c', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:28:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-07-27 15:28:59：[INFO] 任务描述：接口调度02
2026-07-27 15:28:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:29:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:29:10.051459', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643289891155971, '2026-07-27 15:30:00', 'db23abc9-4f06-47f0-8a8b-aad13993f231', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:30:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BPsMw0GhADQzTaZ8Rl4telU0WT6Okm1yuj8dP4dpl+IDtQRNbDeq7u0aUxNXIRZeNXjAEWRb2YPsdlvaUq4Y2dz2xlqArW8/brjtG/cW/fNFwF9boQaf9mXENQTJjuw7MERjNoVog2eLnzyitvqxel4Me16PlIeOusygB3ue7Ik4bHL4HLvmm9V0hjHRqxsvoiMPoMRJT/r7XzI46khXGjt00ITIgzjg4yDhghb0KmNhnVWU/Xep2e9yB1wM5IQcW7eYrR7zS5kBPE29km4eoKOUUxvZFGbirkbbAzL3K31UjRchQuOK1pRmyGi37NCAUM2gxtD678JusfjJpTfK4lH3lHfI1rSuAmh/4r2Uj+GpsuTgVmUB6bEAqUzunpsnqUHpxWZF3BsbJoLDTxTkhNmb5M6FuzPSyH4yDTloUoSDz5TdSwd7mJqcCkIIQo0YwgxH
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : db23abc9-4f06-47f0-8a8b-aad13993f231
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 52ae8c87-0322-41b5-9bfc-b38d69e985ef
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:30:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:30:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:30:10.030863', '52ae8c87-0322-41b5-9bfc-b38d69e985ef', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643289891155972, '2026-07-27 15:30:00', '3735db8e-e275-436e-9697-62bca927eec9', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:30:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-07-27 15:30:00：[INFO] 任务描述：接口调度01
2026-07-27 15:30:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:30:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:30:10.038976', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643541511647233, '2026-07-27 15:31:00', '87314457-be2e-465e-adaa-7c611cb82759', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:31:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJJQRTGFpmBk8bFkMKDhT4pmJ3yjhXYKHUWc8HNCSbdgP9g81pMrroWPzglRFXLtHiiP7zO8NXYaajTznYlclLdfeu9ADRvULXESU4b3XxYRGvW34bHZzmeykrP0iz6XH7vRFnTm7/3+mlVAb2LO8PO3T6LzNbP54JIcu2XpkmJd1Orc6ZGaqR+TrgW7ZrrIoexH273Y8Yfdr9IvDsnkd9PMbKga7Q7+Bzf5MC5dCQZTN5Hz4GC6R41qBrnXLzCJuzQie80CmnCSnfpYLKtvcg4dzPV2JOCo1lnbc9K6Y58OP6aH/SAot3vvoXNCbGELL3SXNztSb386yU6jHyOkKoM7x/x3g5bZthazDzNfVlEOk07HKqCast2osRzxRvwPuizZy++qOMHJfMkw9M+GIbB/F0rY72SLT7vtMLQ4AFLdA3z7qOSEiMdu1hCPSvNAX1Uc
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 87314457-be2e-465e-adaa-7c611cb82759
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 1983e04d-8027-4abf-9054-abba3005c959
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:31:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:31:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:31:10.02214', '1983e04d-8027-4abf-9054-abba3005c959', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643793148915714, '2026-07-27 15:32:00', '649deb4a-d593-470c-b286-0a7e2ce464ce', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:32:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BMGGV+UdTopPEi7gpfqfgBgzlHk5erI9h/Mh5n4TFu80ICfvk89KWqpCDBj8x4f+/0Rkpuh0+1d9urotQAAh9+BAlCl8m/3cPB83yzllVaYBfv+nWD25ogks7g25cr7no8xgXBovS09p93Bwfm7D3nM67fRvL4/XuZFnDA6jfDqE9AgQKZfvofKIx/z76p+C84NtxXigiXiWUUlV12yY7ofkbE8nanKYf1+EAA6zI9A9a3RPiS3JnU3cbJ0WRyXDo9wBFAUHLRt1LX1uhWYZdPo/PFxqhMzHF5t4ZPk1xHVj3kPvh5QAEPsPHGD8x7mLl7H/l4eLzvgigjoHstCZhJAS70NFtMGlYtWRCg2ghgKEKxwzGsu0wZ23NvxAIZpUPJC4gYjGEWrUZTGLH6pBv6mhMAxXeEb8+wj5o/N9qtz6YaGKLXRVAbXeHqJ7IIluUebu
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 649deb4a-d593-470c-b286-0a7e2ce464ce
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 8a598fd1-1d25-4a20-a864-93a65b5f4495
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:32:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:32:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:32:10.016067', '8a598fd1-1d25-4a20-a864-93a65b5f4495', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643289891155970, '2026-07-27 15:30:00', 'e892a4f0-ace6-4c4b-9263-d3e2385838a3', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:30:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BAXTv+v8U/psNTm73yWs5eySie+gu8bqy6pGTdSdpQ1irG0/95fHKMXv868gHvyqjM6HVoQm9MLydred/Dn8OMepkab5lm7N7xQgdLwwFPLOr8CMI4mX49PalmaYzllBnEf2gVCvl6+jmOLI9ct5nN4wVD7DPfZPfQKND+Fi81nMgujcW7LbKm/jvdcxuNeCEGyxMPsv2oSj9/ZVSbo0ay0z7WCAtvBMW7iiMZBTGo9ohHh5hsPDC3fKhb03XahCsB4KucbgiSdqeVucL0mC8XsiCSz4VUHdtTkrq8IBmP0dy79WbuaDsJBEcJO/04NiMhaHoG84fJmkIwqctREZi8op+/72qgr2lQyyAbEJzPcnNKEQaTr7tVacSjDfwD0KwXmiLGDjhtzr3TsoqMzqwxt1WmV2V+34S/NbRxoE20lZSlIVxmqZcXwomiehJg==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : e892a4f0-ace6-4c4b-9263-d3e2385838a3
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 3735db8e-e275-436e-9697-62bca927eec9
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:30:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:30:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:30:10.030863', '3735db8e-e275-436e-9697-62bca927eec9', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643541511647236, '2026-07-27 15:31:00', '1983e04d-8027-4abf-9054-abba3005c959', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:31:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-3 
2026-07-27 15:31:00：[INFO] 任务描述：接口调度02
2026-07-27 15:31:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:31:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:31:10.023657', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643793148915715, '2026-07-27 15:32:00', '011c0714-58cd-4c76-82ad-b63599fc1dc1', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:32:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BOe63dzbYTWim9Q3IviE1uLFMrWWCX4hPE+Mtf9x+CZgUaAAOAwJ80L+0iDV+/gdveXq5OQamEhupjjDI0WBc55xC8FMBW8PUZCyjINar4l4ANTjYLUZFmPKPfssDHLnnj7TPpB3CuiHuzHERUZYtvA561+3VymFXJZa4LtRDqccIeRLVqk72LpaIZ1p7LEfRj07HzhUMLfCgcV7QlzVAu+q4BGLE3pyJKDh7Ae0xNAXK6cdCnyGNAacmphdzkNghWi9bMkjKI7N8MFLP0v/k7CNb7fL17gHPeJfRLqTD7dRIVHVtcmx/awPOtPPfspVhQCuNUCObgmAlEB7Dpzt99a94ruNoJn07hIW57Zmbf4XrTftvg6deS5oGt0ic2jIjfbxI8y4f8XzQpq/zHAOakJ6nLpW2SRqifzskPNC+dGynzkAacXY7ko7LpeLEg==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 011c0714-58cd-4c76-82ad-b63599fc1dc1
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 7b10fc07-f13e-4de7-bcd1-42f9efcc50a8
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:32:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:32:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:32:10.016067', '7b10fc07-f13e-4de7-bcd1-42f9efcc50a8', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643793148915716, '2026-07-27 15:32:00', '8a598fd1-1d25-4a20-a864-93a65b5f4495', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:32:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-07-27 15:32:00：[INFO] 任务描述：接口调度02
2026-07-27 15:32:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:32:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:32:10.023578', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643793148915717, '2026-07-27 15:32:00', '7b10fc07-f13e-4de7-bcd1-42f9efcc50a8', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:32:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-11 
2026-07-27 15:32:00：[INFO] 任务描述：接口调度01
2026-07-27 15:32:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:32:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:32:10.027601', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644044874264579, '2026-07-27 15:33:00', '32022da6-c8a2-432f-a638-b571e8e3f144', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:33:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BOgGEwPEXT7j+FaSTCJqCp6M/3W0JWChOR1maNrGckIUv9mkjqymS71BjFFKMlJ4nzM2jZimG8acJh8r90fgiFPzXplVfnDhV/m56b60GQ2dfwafmjyYzaAZ7rc5KKAVHEXSWXRkrbnoQczdySxCCcYRZfRJUtEw/u/QEgUU+/OM2uc8ZtFxP961ik4M/0pjFTb60xDh974ZmWy53cHebhLmYYRQu1U4stlVmfGKH7FJ7oKkluTE21DTTwiyBSkntBNr3XUbsQ29gYlFGG8mz5xTGf89wixXpCU66V6Z3O1Zw7riAvuDbvQ5Bept7LGs8exXjp6+tFShMS2U6BU2BX1+sE2tkToGk2IZWe03x6/Sswmhg0H9LnrogWzDPVijGoN1wFaK3q6OeBUciroUG8O1Ze0TulBX3I8WILumoF5a+djFaaykznlqalw0tuuXJ6wm
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 32022da6-c8a2-432f-a638-b571e8e3f144
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : c355c762-6cd8-4b94-91e8-b7dc1dfaea49
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:33:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:33:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:33:10.032099', 'c355c762-6cd8-4b94-91e8-b7dc1dfaea49', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644044874264580, '2026-07-27 15:33:00', 'c355c762-6cd8-4b94-91e8-b7dc1dfaea49', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:33:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:33:00：[INFO] 任务描述：接口调度02
2026-07-27 15:33:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:33:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:33:10.041268', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644044874264578, '2026-07-27 15:33:00', '6b2d391c-fda3-4e45-a8db-38d74e2d9d9b', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:33:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BFeickDBOiIxA46t1g2kMevzmqqOpKFO5eXIwAadvsVv8mSiDNOAMd4IBnXyvhCINh1FE5wvQ8pip2v+K2OztyksXAO/nfkMbk4A9+HCL2r+Owh6pAvB5vVjHewJZu03kQ/KkU67hs079mmNeCicBPUJ9A8gkQQVx5f8lAnkWMkWbFayl7rY0UzwPXg7174Mg9x9iTZY5R5kvinTmFo0MdO3rXJ0R+1FfS9mWig6nd3tLJFzYqTPzHuytDxUUFijDheN70x671Y24VvclPu/A7yGpDCWkqwI2Vd0XGDwJiG10pTeXEE+c1L65gu0OKozUL4z+qv6HodK3izWT+m7P9HzczMe0U9H5mGJwNrBUUxNdfAcXxe9MABYvBaeCAZgSkccGdPOru4z/7P/YysSYXvcHP8OJRv2m3OJoscjQYhNIwf78WeFWh485YKbAA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 6b2d391c-fda3-4e45-a8db-38d74e2d9d9b
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : cdb9d584-0e66-42ed-b5c2-55224f1a344e
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:33:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:33:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:33:10.032099', 'cdb9d584-0e66-42ed-b5c2-55224f1a344e', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644044874264581, '2026-07-27 15:33:00', 'cdb9d584-0e66-42ed-b5c2-55224f1a344e', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:33:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-11 
2026-07-27 15:33:00：[INFO] 任务描述：接口调度01
2026-07-27 15:33:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:33:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:33:10.041268', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644296532504578, '2026-07-27 15:34:00', 'ad1b8e75-c012-47d3-9d8f-3abbe2205e1e', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:34:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BM1O2hk04pNQabU7kpFC4fyfgTwCnoedcwygUUZ+MpLmtnyHijDG/opxYmtK+3UCAfdKO9oobJ2cKsurUXa61o7IyS1MibpijZLIjCcIvJBTfWPmmAE12ujESqrv4ZNRZrWVA1s+UeVEBYWAqQ37quhTv23z2ReXGsQ1IhHh7rNW7kh+bvNnsMwqKSIFPZmlDixJJGoNgonuhR0gSqygGNxSbxi2mM3BBgnzJQJYBUMVAZUl70w9jHM3AYUkWmqiPyTSCptwNL2TSWMdissSN3yLx0D3BK3qUfMuE4NNEqSYKwOIrdSPbyDdWSaYTyUAFAt4NUl/2XWzk7G51V2rqNHcARl1lXsUX4+K4KxdhhC1B72zec+amOJ0MIJfqYh7thF8iNxdlY5JxEyP9sCng0g7QuDfTySDasjsktLgmr1Coi504Km0XdhvHXRZUA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : ad1b8e75-c012-47d3-9d8f-3abbe2205e1e
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : d59eb15d-e85b-4101-bb8a-23b839cb0cea
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:34:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:34:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:34:10.032582', 'd59eb15d-e85b-4101-bb8a-23b839cb0cea', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644296532504580, '2026-07-27 15:34:00', 'd59eb15d-e85b-4101-bb8a-23b839cb0cea', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:34:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-11 
2026-07-27 15:34:00：[INFO] 任务描述：接口调度01
2026-07-27 15:34:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:34:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:34:10.039798', NULL, 17);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644548203327490, '2026-07-27 15:35:00', '0333bd23-1400-43dd-9b5b-f6126650e7bc', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:35:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BL9Ld1tdtKj/3ZWHoAkkChXSe98AEiEy0UiIg2TmfsVZQFkympNfmvW85YK9sF5ER7WEeOOlf9i+24QcWxu3qvngMH16hgPldqqn5TMcMeJc1OClvBNevtnQhPLziUquHOCqx+FQc3C5o+7UZLilGrMLRRyEybQBRO+2E9MIE4KmNVxcbo8wzgUmnwdARZnXcNrzYuIhdyq7DevGw82Y5xiXqLwPi9lAyJqZvNGYYZvyEe0zrPSUQJCZ3WtKBxItpAEffjWvOkxOuGUzgp6BFA0x8gkHl833uOK6ERaVyBNuf1N3ghuL+TwwCJyxUlFNOPWPgenEynrhYN/7iFkLpG5VJupnmKuTzfVm7J0hE6cLIKz7lMxBLDx16JMYrSJ0ABBZ0HioXKcXFfbJ4w1ZnS7GEQd+BTR86Nz9RiNTv+JYCsTdZKGayMR+Afg7Rw==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 0333bd23-1400-43dd-9b5b-f6126650e7bc
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 67503142-5d36-4f8a-8493-ab0d1eac5f19
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:35:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:35:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (3 ms)
================  Response End   ================

', '2026-07-27 15:35:10.035676', '67503142-5d36-4f8a-8493-ab0d1eac5f19', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644548203327493, '2026-07-27 15:35:00', '67503142-5d36-4f8a-8493-ab0d1eac5f19', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:35:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-11 
2026-07-27 15:35:00：[INFO] 任务描述：接口调度01
2026-07-27 15:35:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:35:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:35:10.042786', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644296532504577, '2026-07-27 15:34:00', '253eb8ed-84f2-4b56-9571-1e532ee9c5e1', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:34:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BHwavsHos+S3IjE9/g6FVubWCuhUaLIemyK1M/cEJUmWrHrHynagsrzLsvFf6OAtXtbIc/G0/bZNqXXepVGSZyxcvbj0tElUjtHrokIv4caidr4MbNxhB+0sbDl29FcOl4YI7zOAkmjwGF4TIpXgOHMOpGx6cQHBRYzHGOYTVoSj4QnUK29tboGX6V3h1PcuRBGVGccFjvkz+sYoBUmctBjVM1ZRoelba/dddLpm8aFaE83dPnWARGIs4zdosjfcjdW5KNbZMImNV2nPgE+lRY/nuyH+Wk2qcCByaMSEVbA1Ryo66G6txn4fHdGOKlsvFZia5tkcWZXi8oFYyX6NIbLZcZLQWefobb9iwXJti5CF3CdjvHdfoYPtI9WYvL/IXBE4qcTnt5uSnZbXth53HQ04j1HBnfRr1YGMn3zZDsHV4Da2dgs2VkDEUenZHbD2kYxO
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 253eb8ed-84f2-4b56-9571-1e532ee9c5e1
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 2675e7c8-ce9d-4625-9a16-15ff4eff1e3c
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:34:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:34:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:34:10.032582', '2675e7c8-ce9d-4625-9a16-15ff4eff1e3c', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644296532504579, '2026-07-27 15:34:00', '2675e7c8-ce9d-4625-9a16-15ff4eff1e3c', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:34:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-07-27 15:34:00：[INFO] 任务描述：接口调度02
2026-07-27 15:34:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:34:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:34:10.039798', NULL, 17);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644548203327491, '2026-07-27 15:35:00', '36377560-437f-48e0-b8b2-493d871077cb', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:35:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BMZP3rjpR42fcMKagnoJGsgIlyxZFCNDxdAHhLJkEvaApcGlNPlwbzbvoefmBT/XESfTOsgF1WEpyv+q+FTrOg7z6GceFgkSS570frSsUAfVDfaLcIzh2zMr5iAVJlbOxr4WmFmbgdHeiEjsYVZcUt3u7xUHXskXh8Y209MxP4SxepAKwfkSjFKSYiQoZPzzMYeJGtuEfLfuaeb2dupkqwHtCMPQaT6taNYR8yJPwAuLQG5fFI2vJMYcvtuGkCaYN5ZtrKbBuNrcNmxYYSjdtxnfOWg/u8UHqs9nFq70AS80c0jjXlXGts58TacXK9QIhr/7sWwvznc+L44ljPl18KefF70/s2GTb1tLhl2/4DX9CDls/pAMRHZjO9H1YXlk4vIgttCR3eKHQS6jtJhfMCc/vd/jyP6va/Qo7q+l6oiiHjZtp6MIJ/fXc+YrjxI+zLMa
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 36377560-437f-48e0-b8b2-493d871077cb
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e647c6e6-c868-44b4-b76d-54004015a5c7
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:35:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:35:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (3 ms)
================  Response End   ================

', '2026-07-27 15:35:10.035676', 'e647c6e6-c868-44b4-b76d-54004015a5c7', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644548203327492, '2026-07-27 15:35:00', 'e647c6e6-c868-44b4-b76d-54004015a5c7', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:35:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-07-27 15:35:00：[INFO] 任务描述：接口调度02
2026-07-27 15:35:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:35:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:35:10.042786', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644799798652929, '2026-07-27 15:36:00', '613af60c-010c-4c58-97c3-33e499590cc5', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:36:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BAH4stJ7oI18zdKTa+5T5bc11dHu0LY2RCJVZwlBzGy6KA55fL38bPeqC8U/vraYhWy4wvIYHWe2G0xY/oOldNemuzPLOEPo3cmi1dD2Y1f2re34x9WQIlvjlQSRpNgQbbAFvpTDQVvH36Ia+F/8GjYxCVevPQyN2Mv/MUabgM99vyA3IU1E99qHRCtzh4x2wxcKNg1SE5of/HsDe5TUGnVw1nA9oYNQlE4V8zgyCZ97XwCPXK2MvR7z5Bkyw0ysOoc5Xu/o88R75YOGGQKxR6hGzEZvmT1KmR78X1apedSswyUEPN7m7sc45RB8/AMazDli0EFQSD3/WJqhvtBDR2SVcI15neZLreexkTt7oZ589VGLYbEuAbev4MZEhRvpf+DuzbqAVJbF5pcHQFioBYpXf2T5zMOtmyZxlHujpBlX+SHMoRsPxy5c8mC6CnLvEjVt
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 613af60c-010c-4c58-97c3-33e499590cc5
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e5a14480-936e-4391-8cb8-2909b32d410f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:36:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:36:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:36:10.019358', 'e5a14480-936e-4391-8cb8-2909b32d410f', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644799865761794, '2026-07-27 15:36:00', '6dbd7d1e-f57f-4492-a907-98acd1aee5bd', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:36:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BEksVLrtpwR96h4ebme60FiL6GfviHei4CDqh9EtDueVElMKlQ33mpwlfsDBIshf2mr/iWk9muF2zI5zkOSzbSGAGQm1EXxnAfw7uV0xE6ianqMnr1TSU6snXrsnI9WOhP0Fh0rollQEnCxSBgvLoPWHJfApabNm7RjY82WK6FmDZ1ErozMjySlKbK5yLMz31ehfN7mac9DAc9EAWmoMyMPdmop108a4nY/nFPaF0Yc+PsVgA527W+EgltWaHS+qpsy/lG5ZCmfDzcpr9Gp0gWryeog5BNG1pzVsF03nIWHCbMHJbXNp+bWA43owi5tv408WsgUX71eUO8GkwJWHJ19GsZ6vRRMkRq7HmY9NIFTDtFWI+xmzZJhIJzD7CwUwrzansFF4pb8wpIl21O+5+iTprsu/CdW+fJUVtKlb5MsH2Sc1d0R3hA+UyC2Bxg==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 6dbd7d1e-f57f-4492-a907-98acd1aee5bd
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 10bba9fb-11f0-4674-832f-cca229c61496
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:36:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:36:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:36:10.036056', '10bba9fb-11f0-4674-832f-cca229c61496', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645303186436097, '2026-07-27 15:38:00', '792ca9d8-d530-49ad-bad3-b117013bc5d0', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:38:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJubEZDC900nW8MtkpCH8cyzQZYr819RCD6f1xWVMB1t2Qyj3NL+TMI7TCa52WUu/lqm79ngpnbGlYLz7trhAVf7EAsmfDkNuLSiEJf5/x3m0ixHwEdNuwEFFJRsewnUYbjfnFdBSlZLqRSitSdNaECIkA2rgwZxs+Jd4xtuByXFrfO0Y0XzoCUlanv/a11FgvhALQ7x2IYhY2gJBj9JXjfLJhLcTZiiONDfJBdzHi3nFL9sFNjgwqe6rPQqPIjua3jhYgE2giCQgs4/PfmMGzy5YlMuuaeK5lk2oPTwph2ZvXywsFgHnaiQk4jsp+3oPKOQyoY08ymRGDef6advfp7gF9DlwziBg67xVC2Ja6hfqgCn4w7RjCNDFnKXLn20O0yUvb91WT+mZvfRICnPrDJ1VRQKc6j3x5t6rWxMo1iucfgAGJGnVvcGL2be2fsgdel8
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 792ca9d8-d530-49ad-bad3-b117013bc5d0
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e3e7cf58-b806-45f3-b997-b3fdb79bd570
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:38:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:38:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:38:10.037348', 'e3e7cf58-b806-45f3-b997-b3fdb79bd570', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645303186436100, '2026-07-27 15:38:00', 'd00d33b3-310b-425a-b4e1-fcf124c0dfb1', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:38:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-17 
2026-07-27 15:38:00：[INFO] 任务描述：接口调度01
2026-07-27 15:38:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:38:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:38:10.047383', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645554853064709, '2026-07-27 15:39:00', 'a9d92b1a-db8f-4587-9fc4-32a7bf01e55d', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:39:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-07-27 15:39:00：[INFO] 任务描述：接口调度02
2026-07-27 15:39:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:39:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:39:10.03973', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644799865761795, '2026-07-27 15:36:00', 'e5a14480-936e-4391-8cb8-2909b32d410f', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:36:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-07-27 15:36:00：[INFO] 任务描述：接口调度02
2026-07-27 15:36:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:36:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:36:10.036056', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645051448504322, '2026-07-27 15:37:00', 'ca56d54e-dec9-42c6-af46-377a26693e55', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:36:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-07-27 15:36:59：[INFO] 任务描述：接口调度02
2026-07-27 15:36:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:37:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:37:10.018179', NULL, 10);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645303186436098, '2026-07-27 15:38:00', '83cd6aa3-698a-471a-8a9f-bdbf62d204fc', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:38:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BDvFixUrRlfvZxA88QmeaoTJGuk8KfP4MfP3zYh1zl9OEFukMz4fmcDOSvhrU1jBzKEH33UU6/y8WLimpn0KmuvqkMLyYq89vdvlrT4bTP/lN4HcBwvWtB6+MpvxhSayLtZUcjrXhaKy86iAZXFbS7H2dYDJZx/FIiS31ebO9Z/OOx7bJB9vHIt/8zvRE/Y6z/NWis93uRBVm4KpapptglXTAhCyMHakcPczJ7bMzy/lDsvNgjaZ8TY4CAv9sBki739X6dvDERuYX+pCMGXffU8IMddvE5TFA40Rs7jBGzqqRdln4v5lolzy44zKChapBO0tDDTrL5Qop6HnUnWl4YC0NLa+ViByBpaOJtHzjqzGWDjU/GtUe9cBkRB36urjwTaTv98Ondc+H2jr630MRQ0gDvCUZwpOBw0sRoLidXQELgaasCPkc0yZCdEz5w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 83cd6aa3-698a-471a-8a9f-bdbf62d204fc
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : d00d33b3-310b-425a-b4e1-fcf124c0dfb1
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:38:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:38:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:38:10.037348', 'd00d33b3-310b-425a-b4e1-fcf124c0dfb1', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645554853064708, '2026-07-27 15:39:00', 'c8a1d181-9d7f-4828-b660-cd997a18c2e2', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:39:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BLvOADgmo4WOwdD/GGFz2YrQ6Gnug6WRg+xrdd6qoJR6Yx9LMojg+tOyopyXaENgcgd/dWyU8y2hUQOqS5WIg6fizp6/CV2e6kG9+uNEMPdT2L8rIDHBY/cYUn6lVPl+34h3oVA+2vQhDLxgEfZFwr9u2ksRHMWRdCf59Rr+l5GyzVe0/XsubAnb07C6VF0kC70LBmW/Dqlh/4a6mE1o2oNKfQxoEeIPVFliFX2Re2rkBQudHt86tSoMUr5HjZcqnbaDMkcpND6SLZkdYo+iKMYjq5nr58yyjJ+8R9buysH3YID7CkR5rdrjnoGjt2aOxQd+LxL/47oCi+Uu3oDPedxTuZrUURpDlMEF4mrkIIp6FjE6VALOxhhiT3cpBbqsO42e2ll3/n21i7jwToOFg7t8iWg5l4y4jOY7eOb9vjG5q+48UbjLT7JNJ1E6TLkihdkn
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : c8a1d181-9d7f-4828-b660-cd997a18c2e2
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : a9d92b1a-db8f-4587-9fc4-32a7bf01e55d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:39:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:39:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:39:10.03973', 'a9d92b1a-db8f-4587-9fc4-32a7bf01e55d', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645806414835715, '2026-07-27 15:40:00', '1487d405-97ec-4912-87ba-2b9107dea7b9', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:40:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BDieoedj+zzUGINlc0AV1biuFraF/F8nBK3Tco2gPRYfhNsUytd+L91JgnmthonW1VZAXhEyrH10/VPaQoCGn5+JpDDyRfe+QdlADVQeweNJmUnT9Dpw4/ysoJzXuqk54MODVJnGXOVQh4pWHSB9/e/NoBJ6GVFHyHNyJUvgSmuurGDjG44SnoZPKpkCf9X0weCNKamMQr/Juu2hpnfxd1x61OWGgQYf2HyDPRUNbvMxHIHybzHhySZtjiVzgZyMX2/83eu9xkgZhOKQqqFk+k0gO3HxnTCxmhRjoc6Ms4EFiXFCRzMC+onPA0yXKrTUOjeir1gy5z78+c5O7GrQkbinby+H/3nH+Tv6P4dtWDfgNScyzQlSJ8JXC2r0M4932w29Ad8g+N/W3IHZkZ0oGhbQEU3ZeE1Pt7WuFzszb9P1mEOXGUaN1ZZyd3a5BA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 1487d405-97ec-4912-87ba-2b9107dea7b9
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 588e1997-0ac7-4395-a066-0ffc524c7b17
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:40:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:40:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:40:10.015737', '588e1997-0ac7-4395-a066-0ffc524c7b17', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081644799865761796, '2026-07-27 15:36:00', '10bba9fb-11f0-4674-832f-cca229c61496', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:36:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-14 
2026-07-27 15:36:00：[INFO] 任务描述：接口调度01
2026-07-27 15:36:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:36:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:36:10.036056', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645051448504323, '2026-07-27 15:37:00', '95625c72-9ea4-4d60-b869-b73cb1d60936', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:37:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BBVrw9hYoEMEoEpHMNbOlRBmeU+tH+2DFPOwI9Xw0MNlTTFtZ0IRaTBuPQsrmqd8pDtew/RjB11mIAhXvbWgnrFj2W6lFp6jwOw1+28jnQbsBeP6H4RDhR3mG4Ll4DAHN1NJOuBPWPjgomuFrg6aME+ZmwCcZk++X+fAYajGghaaQvnpxwW739zqJcfAQX3MpXwJJnATzxK+/J4scFdNmAUM1+KxutpyfyprUtC5lLgMNhsBXepLHgW2uDN8nkFU0/26njUtgFjCRwu217/+uRX/n9r7Wh00WV9V8TbMyniKHVNevITztdnG2m/m+Sqpa/+WjvboPo/oO3iBSxAh2E7buu8PSUMx20pojgGwoHfiVTSokLyeUMT/SzLuCVHdVv0M+gTgG1Zfs9dGJCeTD6ZNF6ATLOu43E70b/QY7PPBwsP5xKqyADsPVYGIQ08f68kM
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 95625c72-9ea4-4d60-b869-b73cb1d60936
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ca56d54e-dec9-42c6-af46-377a26693e55
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:37:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:37:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:37:10.018179', 'ca56d54e-dec9-42c6-af46-377a26693e55', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645051515613186, '2026-07-27 15:37:00', '9f89343b-0d53-4fe6-bec8-0b8a50bb30bc', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:37:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BOewu8UQBmfdBRnZQTTHypVh7RJtXddD9sidRWVIG0h4p+aKfO6LEy7tc56HqBsDdeu7sVU2156YlBDqZfbyJ9J3RZ7NoNKEbUXG+Mp0VtU06vNrnqYJk4YYp5tBI9lY7RsERm8LGH6QmHlLcEllI1dgqFP9gCRptJK6HEAMmUKEhDVnBccR9CUXbIj0HQD+DDeCGp3bE5hXQHgar+6AIwF6YCAgm7UiOfe3ETLsqcPZPgx8VP2OR+jprgkQP/Mnq9TWhnlYOW/yG3zYSCoLM0pr9M3DNS4XpvLUM5xI8fp/7s3Sc2b9zgTyYoxIKCd7y51sSuyq8lPBn2uqqWWUpEBsuBiIe0ZYeFoAMTSElDV71wNLxMy4+rYBMd0XJDsGA8U+IXS6RoEb2CNPk53yrfibXDasTNnjrxWskFzgrr5gxQKyD+oMtCQXYNyy8w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 9f89343b-0d53-4fe6-bec8-0b8a50bb30bc
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : cc106cf1-f07d-4173-83c1-f89603b18265
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:37:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:37:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (0 ms)
================  Response End   ================

', '2026-07-27 15:37:10.033405', 'cc106cf1-f07d-4173-83c1-f89603b18265', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645051515613187, '2026-07-27 15:37:00', 'cc106cf1-f07d-4173-83c1-f89603b18265', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:37:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-07-27 15:37:00：[INFO] 任务描述：接口调度01
2026-07-27 15:37:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:37:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:37:10.039422', NULL, 20);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645303186436099, '2026-07-27 15:38:00', 'e3e7cf58-b806-45f3-b997-b3fdb79bd570', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:38:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-8 
2026-07-27 15:38:00：[INFO] 任务描述：接口调度02
2026-07-27 15:38:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:38:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:38:10.037348', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645554853064706, '2026-07-27 15:39:00', 'e6bd04bb-9f7e-4fef-95d9-d197368de9f0', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:39:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-17 
2026-07-27 15:39:00：[INFO] 任务描述：接口调度01
2026-07-27 15:39:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:39:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:39:10.03973', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645806414835716, '2026-07-27 15:40:00', '588e1997-0ac7-4395-a066-0ffc524c7b17', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:40:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-19 
2026-07-27 15:40:00：[INFO] 任务描述：接口调度01
2026-07-27 15:40:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:40:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:40:10.015737', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646561418915843, '2026-07-27 15:43:00', 'b94d69a8-3f5e-4bac-bd06-c8ee0e915fb3', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:43:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-07-27 15:43:00：[INFO] 任务描述：接口调度02
2026-07-27 15:43:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:43:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:43:10.022707', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645554853064707, '2026-07-27 15:39:00', '42e787a3-cf84-456c-827b-064674dd8820', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:39:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BKJlkwksAtSs/RFE8roW2cYyGHYWUPLZgZRSPxMNeO1x6PflQNVg5sBr5awS1NMwOjjk5eM2PdvGsVIgMMweVijoCsO4cqe3ftZUBCWMD7IKVF+EmLa62uOi4+kRBCqxUhGT4wD34SaHKt6nF08k2rz5UTW1dCMjWDwfGYW+V9aTxxdRx3Jootetbj6p6kTSWWDCVyFZWsochfA65V3mkrOdar6L8yDetMkKwLC17ZAcfwAJg9Hn3O+c4XvZOCQy2GWFl5tcrMIZxX54HMMq4qhQucbCIXad80f/6t2DG6Diha8mGwv0dtHfbgAW75JOEXQilKIbme+P4Jpr65BNvfW068SwpO5DN2EZbtWT4eD7iNlkFHHHfreh1jbthstz3cgnLB85XUwoGnaqYZqxG2PTZjuKLW2GkfXwAn0XlRNDhJG/g43Gf7N2LRcRbA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 42e787a3-cf84-456c-827b-064674dd8820
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e6bd04bb-9f7e-4fef-95d9-d197368de9f0
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:39:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:39:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:39:10.03973', 'e6bd04bb-9f7e-4fef-95d9-d197368de9f0', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645806414835714, '2026-07-27 15:40:00', '0fa64843-3651-4bf1-a230-44193064ec70', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:40:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-07-27 15:40:00：[INFO] 任务描述：接口调度02
2026-07-27 15:40:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:40:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:40:10.015737', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646561418915842, '2026-07-27 15:43:00', '76774bfe-563d-431b-85e8-9cef51b6e0d5', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:43:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BGoWR9m0NesAV7x16fn1s8BoGak0zHbWADNJfBezJxUm19xYjd4wo++UvXlsQyNoVXdTNY1REjAlFnTk6l+A4AYJBkgH3uYAdYHxJ5dSHATqkusMwqKvRW5SjzC0RQ9a9ty2QzJvjaUPZybCXzMFr/4T2iPHVX5wCY+asVPvyrhvYWJtj2lyHAnfI7SRGBvwkowe6SIsU3Y9Mcxr+M9XNSuzHQD0amZj7F0IiQUfiX7dqPiQiAelptw2UvdG/7sX8I/8NafRllWpY215b0FENDuyFfN2wZcOPlLMrsOHr/5jBoKzj6Up/2VDe4M1GSDFHlV0dVhqoHEAiUGf+ChniM/qsJaLEFjKTKN29Ztd9W7X3wwPakqgg0SLVWKpZznBQVQ3WDXYSdkxIroocvirOQOqZ1dwCiFO+/NU01YTVV97ZlnLKhppbT7rG2PBfA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 76774bfe-563d-431b-85e8-9cef51b6e0d5
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : aaf29c0f-6593-4895-b831-95fc18316f9a
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:43:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:43:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:43:10.022707', 'aaf29c0f-6593-4895-b831-95fc18316f9a', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646813110710273, '2026-07-27 15:44:00', 'e65d4954-3b4f-4c75-82a0-b536b84b9514', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:44:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-15 
2026-07-27 15:44:00：[INFO] 任务描述：接口调度01
2026-07-27 15:44:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:44:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:44:10.030915', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081645806414835713, '2026-07-27 15:40:00', 'fd19a924-fb49-4c2a-9934-8fdab6c38cac', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:40:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BGT+lXZz0tDXnzqiOJXUJGIFi/pcg752iJ1p+ZbnpEQOXZW9Igj9JpDu5mrsm1MfHPrsl1kTB3qBeYe5g37X2Lz/CAc45yCvNCzq8E9d9MiC14t98eDfL1PHfKZO8GpXUvSONuz5Kuhe4j/eMalkVA6CyO9UKVAHjoGOwo1nOaYTJscoIbOxjeJhx4TxUxnbwH7znN6Z47Zt2+m3PHXIzd+ygEZkM9O9vaNHpEQM+vV/EwFGOmhXuB/b86utkIZ3CSaa9Z4D7D0KLd/3STgdxahVZQJ8JdnWVA4goz1n94xUL0dPpiBi25wZspU7hFFEWMgIQnGPlAT2jx3k/PA1ZXpDjh/vLK+3KD+jLtqe16oJFR7otc+P7v4fXJMPVE7qCHUDXJyzYGb65J1T6s417PN5y0nNLNs5DYaM8MbvYnqnNoAm/gN5il6r2OzEQVSAiOP4
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : fd19a924-fb49-4c2a-9934-8fdab6c38cac
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 0fa64843-3651-4bf1-a230-44193064ec70
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:40:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:40:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:40:10.015737', '0fa64843-3651-4bf1-a230-44193064ec70', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646058068881410, '2026-07-27 15:41:00', '381a4b35-343d-4351-84f5-dbd467ab2d78', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:41:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BPVq1IOyFtUMYYVx3HJv/jhjwOR0qxwSM2a1iqeJtc2RtbDPWeHKUnCDZp51NLq9hAz0wGNmwb0TISOGmcxIJrAN3jkpqAZWzqK8DvU2nncp7vYAz636wkmIRnj568Ed05o8kZ/paXtf7dtGW+Q+8beu0rlKpMyvo19Iv6XEGQjXokc/9FwzjNGRssvvsyBpD5gpXcUz04/BLy2W8JfeXqyy9ssuubobRQHgsZNpPgJvROanIVw9Kw5bFR9tI+ho9PYSaB4YBo0MU5ZBqrucWmfMBg27pcnScps2pKK3mJuPiwmrMbOoNRe0ec8XjZamuJrdofYG+uc3gmfgetLVh0x0WarNa2SejTUGZe6W5pwGKUNw8pjzTYGATWowHfrTfwBlLweqPZmZXjMK4btq0YTNUDkMTta4UKfxmr9zzDKTm5p2kIsWEjkbLPApbMKs0YXY
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 381a4b35-343d-4351-84f5-dbd467ab2d78
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 82f18f26-17bd-4003-8305-872eb68b1009
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:41:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:41:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:41:10.015476', '82f18f26-17bd-4003-8305-872eb68b1009', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646309827784709, '2026-07-27 15:42:00', '31ceea11-e6ec-4726-9462-94eb5dab200f', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:42:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:42:00：[INFO] 任务描述：接口调度01
2026-07-27 15:42:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:42:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:42:10.049845', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646561418915841, '2026-07-27 15:43:00', 'aaf29c0f-6593-4895-b831-95fc18316f9a', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:43:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-07-27 15:43:00：[INFO] 任务描述：接口调度01
2026-07-27 15:43:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:43:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:43:10.022707', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646813110710274, '2026-07-27 15:44:00', 'f794624d-0e36-4146-a9aa-70ef79c1d35b', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:44:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-07-27 15:44:00：[INFO] 任务描述：接口调度02
2026-07-27 15:44:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:44:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:44:10.030915', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646058068881409, '2026-07-27 15:41:00', 'f75b4d91-9a24-4a58-992b-06204779ee2e', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:41:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BJ+DhSEYU+4+4R2V0tZ83fGP4wWXW028VMOADEA8U3d50W+5r1onO9f4xaUwWK3C3WbL7L+CjHh0quZocjV7rcLvuyD6b7JsffAfQezMMqMsVnMSIS7nql/ZbMOS8f0Q+pGydcZn7Q0bZvIwS899DKHfD0/vVRSwxoNgK3BBgMPSXH3aShw7KdBxNdABGvCW+ZBIJTQGY1/66d5dHJl8MySfcne35D41crLvrLup9ww7NiaNMcRNpaza5UVSZTC4nl177BVGjR0ur5VGuEQRna2WH1dK9GS+UUkUFcKaY4/ImLF37WyLvY7MxqVTpi0zVTPXFdB55qGZVEEnDMkSR1SyfZ9vck61ooK/7O01pvExHIHAeKnEIaI4dZmXVdhG7RLqfgAE8z/ZzYnnV423bvtGOa0fPFq+FKdwGd0HWCGxDP4IBrgAbOtjlZQk3w==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : f75b4d91-9a24-4a58-992b-06204779ee2e
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 821c818b-fe2c-4697-aee6-7570cf49105f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:41:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:41:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:41:10.015476', '821c818b-fe2c-4697-aee6-7570cf49105f', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646058068881411, '2026-07-27 15:41:00', '82f18f26-17bd-4003-8305-872eb68b1009', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:40:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-12 
2026-07-27 15:40:59：[INFO] 任务描述：接口调度02
2026-07-27 15:40:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:41:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:41:10.023679', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646058068881412, '2026-07-27 15:41:00', '821c818b-fe2c-4697-aee6-7570cf49105f', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:40:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-19 
2026-07-27 15:40:59：[INFO] 任务描述：接口调度01
2026-07-27 15:40:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:41:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:41:10.02819', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646309827784706, '2026-07-27 15:42:00', '935cf119-2e15-402b-ac0a-8f6cbccb4940', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:42:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BDo/BUn40Kn3NQI7ykiEVuYBgl7iy45cpoDuHvXvAoVnEf1eUuoHeoWMADXeYYF+NhiWRUls0Jb2e1IdC0xICTvw1MZjSglGGo9Lrzs6WhHOXhsEdP61zpaOvxhtlyLKGB04EWK7NedDfo9wBHEcGlx37atqVBdeF/14PLceqCCEKQzlcqLCmfsTcEPC9lbB+wr/6MTgGQG6PWmaisCWPisxwXvNWDLoyUhFs/AmgCyxT6rnqSdVLi8vXgJcgHryEvzSzHed114cdXcCC7xP0KVQToVGZS6VnBPGTrFDCS1L4B4Ia8OE0qAK9O+nCyr93rGePi95jHqJ3oaPoH0UgNwd1NTm+0oG+vvW7gqCpVB2h9fsMjR4LDGKHkJ9ZON9WoH/bBIljVYzwGPT7QZAVVHka/Pppn85PaYqW8Omc5TT9lyo1aZIeprylJ6nzdUhJaj+
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 935cf119-2e15-402b-ac0a-8f6cbccb4940
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : f0cf2c2c-e3b5-4fec-9611-8e3b1fe53194
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:42:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:42:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:42:10.039141', 'f0cf2c2c-e3b5-4fec-9611-8e3b1fe53194', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646309827784707, '2026-07-27 15:42:00', '193216e0-561e-498c-87bb-d5b82edc2301', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:42:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BMAQMheFU512LswvyERi3WWAXWKJFdwY/vbj5DrRtVFpU37B0zSCXtQCMvQrcV1R7BVDtiDmrLY34CuqRF4hsgnFgOWykJ3T3UXc6C+YjhJoanLtrr73puiN4d1/FXwrVTf9DoucJA0xt+IWKqeOvwZ1XmVNImv/MicCFNI9dxHVZg8UyBgRG2BPR1jGczkm4xMUxuxrLAlSnS0fOZaY6ziKONpJavN4laRTuDIkXFmJ7HOs7lcMe4n3w48pVgA+nehbI8KbU0c09GvkmZq16bFY09H8he04BOposs1jxZ7MVwfoLqBQ/DDwpMofV8qfK4IHLGw7ZxRf3k1bw5kvbtYnX0eqDoYqUKtED4XbI/fp/B9AdKamI0ID5837+4pxg5OACBfvaB3vHWzmSQJdtTCMjWm0ScHWFDBdZBXDPzRoa5LT0Qfnlcv1kM58fQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 193216e0-561e-498c-87bb-d5b82edc2301
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 31ceea11-e6ec-4726-9462-94eb5dab200f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:42:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:42:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:42:10.043839', '31ceea11-e6ec-4726-9462-94eb5dab200f', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646309827784708, '2026-07-27 15:42:00', 'f0cf2c2c-e3b5-4fec-9611-8e3b1fe53194', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:42:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-12 
2026-07-27 15:42:00：[INFO] 任务描述：接口调度02
2026-07-27 15:42:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:42:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:42:10.049845', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646561418915844, '2026-07-27 15:43:00', '81fb948d-3fd1-43d8-bf31-99ffa262cd8c', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:43:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BPzRNq4wm8TT6RdkGFEY8OWppHquc6KgZglS0bEIg/cHbaQiDwKSvmKhnAZ33QjlJFMBjX/yp0s8oROILOBMsMK8OWwuEOP9bOCsax5m/WQzy2GU5HoJ/hZjwSPEqA5iWG1QLq4D55v21ZAx4bqxZdu2gQNJg0ZXCGpotU0zWzc+F522jGGBYw6zXYY0NrMxP6p5EpN/BJRiBUKcDzSCcyA/WXUWIIrhwHBlE+5QMhADKB1ONlUnIsvYRKmi56eBSQzIE0qAeRZSowgR5iVaDdmUg/KsJtNsA/YeV+PmMgiAu5GYpMpS8+DP4P0yb6ZlhGzaEHQSh6m3VXtUDWXCQhmhuNqQuw685wpMoj/5nSZbyj4N+8JJL73aAnT5QVKXOHLfxulyXK7wLufwYYFBF3nP4CsJKj5uVvbdiCZePFOQpTIVLu8RaeQJEAAETqejK+k2
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 81fb948d-3fd1-43d8-bf31-99ffa262cd8c
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : b94d69a8-3f5e-4bac-bd06-c8ee0e915fb3
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:43:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:43:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:43:10.022707', 'b94d69a8-3f5e-4bac-bd06-c8ee0e915fb3', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646813110710275, '2026-07-27 15:44:00', '37645ae9-043f-4ef8-9d74-ff17aa53b59d', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:44:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BGp8K5zbXLc/q4Z1lueLuUEPJJhSXcxCw1dii4Q8M8p1Y/tX/gEY7af8vKFY+9ck7O99FifKdurcQD9T3M0e6MNWKFmmBrWVPXJ5hA/sncunUmdnnwMBHXbMHYcP7ApaMMRtsOm/IYYmL+4+jgBB67x/0pEwgQ2hU5F3aLh5RJbXczWs0iRP75IVqMA5WFmzkPoHlV1z79l5+NtQBRbIh1GnluAwBijfvhxuQJhJKrx+2oT2IeS8cUMpfSIHdxz5R8sQYAqw7VfbGSvTN/TeBZDfXBjWcqgmz+dAcYiOdZLXsa8x5e5HGTpTKWr7EBdonid1XxY8SyuTSKtLLkJAPdue1O2AQwhQHLnDVWJZP6O/O8ijTs7TvUS0LOdytehvzRXEohBzor1lHvkDM2zD+lfODNK3rhoiIsXqrpffqT3FaGbyw9XFX5/ojoc8OVPmKRR2
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 37645ae9-043f-4ef8-9d74-ff17aa53b59d
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : f794624d-0e36-4146-a9aa-70ef79c1d35b
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:44:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:44:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:44:10.030915', 'f794624d-0e36-4146-a9aa-70ef79c1d35b', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081647064731201539, '2026-07-27 15:45:00', 'f3bc7061-6eec-4a9e-ba13-28289db88946', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:45:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BDcLLcPwsEWw/qZkfQgK8nnUGDyo2I2FfFWyqmmXtqjUBD+ermrEd8Iu0sl6y4wJWv4FauKHCWkgCV7KRvhn/1ROiDqfnWqr6NQOOyUhNiGLAzSv/D/kDMWW6fE+zeiGuG5m4kVYTEb1kG/DoXWdCqCxavN6zUe4nQiReNB5IIqdPUkdiLsArAgCFa2ZT83feNsMdB7C2q9uc3/SKE4mBoHKuqVi5PWLxBE3HAb7jDUOgsQY3juvzC36DZVswsFpbYMSRcmw/QOqa+wNm1r1xJWTe75oQ53Ssr8EOvBIhnH+VF0NMRZas5A5aTGFsovD3srKy/vddSF321ZUyY8dxc0tIV67H9VEa3XW+WombZJLcw2GAulOP0ZTPTy+b0s7Yg8drJsRe83pOJCjGqlFYHLcEO2/JzsIty0+1Z1nfGdk/OvtGIurOph04uK+jw==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : f3bc7061-6eec-4a9e-ba13-28289db88946
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 2c1fe159-45e5-48e7-93a5-9e5e976da012
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:45:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:45:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-07-27 15:45:10.020977', '2c1fe159-45e5-48e7-93a5-9e5e976da012', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081647064752173057, '2026-07-27 15:45:00', '2c1fe159-45e5-48e7-93a5-9e5e976da012', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:44:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-15 
2026-07-27 15:44:59：[INFO] 任务描述：接口调度01
2026-07-27 15:44:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:45:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:45:10.026985', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081646813110710276, '2026-07-27 15:44:00', '1b7ea668-e4e5-4e27-a49b-3aa3935e1afe', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:44:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BEc5FjYMvRDSyWXS9KBpDq04yQB976qoTCrw56S29abHP6KVqQxjhQeSNdZIhah7xEOfz6WRfKcT6dOWYaFDmXRnFTmCYl29E0is6cYLulWb6k6OeE7wHl4+PraTHY4smaziQKRPyJA+ea2945cqsiBeVJ6QN6R+Z3j3woyc7Jw6fHRjwPFzOBFUph3vwt+M5tSqrU5Xge8MZkotYJN7clUkSavagQ59hx3IIxyHkETa9Pnb1AZjaceE0kTg3A55agHPpYjXLFEprEEKKbbrC1yVK30+iNag2yYaVxBUvBHWBWcrIAakQ0sB4eNxDDEJio1KChVxM/d1mC+llmKk4DFxQoeVbHa1cioxDBvnxGANRSHyYOVORRyelLYRGfe3qibZ8Ifn34fB/lAVgjjzsUtsTldIG1N3RNV25CPnpLzrNKvUj6A2tcwbuj4tzQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 1b7ea668-e4e5-4e27-a49b-3aa3935e1afe
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e65d4954-3b4f-4c75-82a0-b536b84b9514
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:44:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:44:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:44:10.030915', 'e65d4954-3b4f-4c75-82a0-b536b84b9514', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081647064731201538, '2026-07-27 15:45:00', 'ffe605de-d523-4cba-9086-8fd9e0dfe5ce', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:45:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BEdmu2VBzcl+q9tblWA66soD02WVuvHscs2lG73v12QADeqzp39i27lvIDTpIM4ed/BTPvrJLZ0NdEvn26yeBKaqZ49MLFWXKH6eCnvHdWG0DX5N+jnpDrN52w0vY6sLxJ+xaeq9acX2CVOFGeFBlvzBcP0bj8S+8exgDpLqXyxt2pBKRmjphAyDhLgZxrxAoR1JHOsIgG/Iy1TFg5efyVQpmVtPottacxmTudk83hpFsCKfUByVv6dXh7bGDOYrPqno+Ax0JHiwOvVTlKg63fF2ZWYdqpfiaQfxqV50jA4aBpHq5QPCV+Rq3X72qxTLnoW2tnb+XVAKmYOXCiaBUswzRTzXZCJA45LHuPCR2ZlfDEFi8+N0mKnoL8Dph3ACxDQlcQm00teswcZD9Vq5qdrYZ91KOAosn3V4IFlGMap45gxWRF3k8Mu40IfRjxKxOG/J
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : ffe605de-d523-4cba-9086-8fd9e0dfe5ce
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : da4200ff-871b-441f-b24a-e2cac416a59f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:45:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:45:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (2 ms)
================  Response End   ================

', '2026-07-27 15:45:10.020977', 'da4200ff-871b-441f-b24a-e2cac416a59f', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081647064752173058, '2026-07-27 15:45:00', 'da4200ff-871b-441f-b24a-e2cac416a59f', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:44:59：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-07-27 15:44:59：[INFO] 任务描述：接口调度02
2026-07-27 15:44:59：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:45:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:45:10.026985', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490318716702723, '2026-09-20 09:55:00', 'e06f0604-ee7a-4898-9184-16adbe810f75', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:55:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-09-20 09:55:00：[INFO] 任务描述：接口调度01
2026-09-20 09:55:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:55:00：[WARN] lock dev%40%40module-system conflict;retry time: 1
2026-09-20 09:55:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:55:10.343286', NULL, 277);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490318716702722, '2026-09-20 09:55:00', 'c7ec9c98-aa5c-4406-a410-c0ac0a9fbb05', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:55:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-09-20 09:55:00：[INFO] 任务描述：接口调度02
2026-09-20 09:55:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:55:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:55:10.343286', NULL, 277);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490318716702721, '2026-09-20 09:55:00', 'dc341e25-707a-4c1a-84b1-35da26e8407b', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 09:55:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BA1d3qrm2DrQGP75XGPHIelgczrkzlYxpQwEh41mSC5bNPNru8p9hkf2oG6EUUZPWqxFVB5WVBtJp8UjyDVs+YzTHE+GkR2jbQv2xLg43iTtjUKiXEbNCL59hXvHNFnRAY2lb0XKsHaGJwstZHkb1zE0AWWf4+oyIp4FkcvG7kgXKCCOvo3njG5vIt/H0PLG8B/JR2amh4o11nHZsBeeuaKNeAnF5IMaiscaNb+ZdmelNwZjmqR5SHO65FNHfiEhIlnChEZVbxq6iaXhfRINeAq82B9aOwA+FT06nAFcpppSxl8yePLj7K/thYPF2cZdHgmqgwl2QqA5rbOijuoaK8Miz9BHUOyd2e1I9JQ0cREPygJxMcQBWGIqneuTzBG67SvdKMGr2xhLB8/LEyGRo2j5pNxb4tCIJOJsIKmmLwyDWmGRIsOfcM8kMqDFHhlHe85p
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : dc341e25-707a-4c1a-84b1-35da26e8407b
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : c7ec9c98-aa5c-4406-a410-c0ac0a9fbb05
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:55:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 09:55:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (16 ms)
================  Response End   ================

', '2026-09-20 09:55:10.334219', 'c7ec9c98-aa5c-4406-a410-c0ac0a9fbb05', 120);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490318716702724, '2026-09-20 09:55:00', 'a7ec932b-679d-4c02-89f4-b02b336f4c81', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 09:55:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BEsdJXI+OHTWSfiEB8j2xkQIQEr0dYrqeNrRnJJQHSDxu0xASzBwtX9PQl9Qs2o8e5RxqZx6lZsgcPKaAKDSOyUuOc37ULL6gHXgWBpTtDRw3gVI9bvujVqtWjU2pTgj/vcweFuGiZE6H+rvyOSyfylRJ2WId6BnMoX/eiHLkKFntBQ6ArZa1Kh8MSLYKlG7oY9mHDOcgOyBQjT2VH5+CGhZnjvOC+J42D9/PdAN9eB64ngsrCVkRwhiw39/VCGLIbEkLn5Av7DejmsxdwXqVWhQwCOM8NrfE59IPz1EvFP6iuumTCL7KsbfYJWlZNDshvwUYWtsRuA+1imR7EMbCL8rCIGtZITMi9ZGf3v95q+YNq4+TS7j2Jj0y+CrpMeVpooT+bF9SVdpU05h2duiTgiJsxDCH2YCredav8M1Mf6qfmESz6DKBNN0sz+LeA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : a7ec932b-679d-4c02-89f4-b02b336f4c81
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e06f0604-ee7a-4898-9184-16adbe810f75
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:55:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 09:55:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (16 ms)
================  Response End   ================

', '2026-09-20 09:55:10.334219', 'e06f0604-ee7a-4898-9184-16adbe810f75', 120);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490568688832514, '2026-09-20 09:56:00', '54546f31-0e52-4b25-b75c-1535bccbc1b1', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 09:56:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BJoV1dNS4K2toKA/VPz5wzEmCr8KCf40nCW9S/K1IzYwWqWFYUJhKs6ozwg5oZMqx+nDpff3EW4JGECSrPnRr/QTUB0Q4oZW9K4C+ET6lbF14aCMjspk79g0pM4495ldIdazGrmpZ0GGoieE0xC9HoB9OQJyqqkJKdr3yRTbXRYvaqYnhAIZiwmRNry9Tj26c0VAEcCCjDKM5cmLfsYM1Bau9HvdHa7h/z05cgzk2DanlskjUC2MDL/ZPsnuEWwNvRwQQZKJDWlqki2z8ei9ubxBV5FUWQJw3gkCu2lHYKYIgUYiN5tflb7dK57auILBNyuPT8/WTEq40x52Lrx7G6XRTpMbL+OV2ff45keeOAvcfKiJvAHLFPUV7ggAzTUz5ncvDZr26XhDvmLg5MV8Tp17/XjXXr4oKO6lkfB1xu2YL0e5z+WtwZTI3UDPBA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 54546f31-0e52-4b25-b75c-1535bccbc1b1
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 8ba59b2a-ee10-46d8-a0a8-3be5c2996727
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:56:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 09:56:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 09:56:10.04031', '8ba59b2a-ee10-46d8-a0a8-3be5c2996727', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490568688832515, '2026-09-20 09:56:00', '8ba59b2a-ee10-46d8-a0a8-3be5c2996727', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:56:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-09-20 09:56:00：[INFO] 任务描述：接口调度01
2026-09-20 09:56:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:56:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:56:10.045823', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490568688832513, '2026-09-20 09:56:00', '0e2ea59c-2544-46dd-bea8-cfe1e3e26f3f', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 09:56:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BMNiytmPF8ikMmfY8WBs/VxMINU+KSUuiwKKAdue2am/6bXSNPt2efy/OqYBa3cJutKaJUVde/SdTEcl96A5c3af8ptQzbcRqEY1Sr1D3kYe1cx/NqgjmSp7NNa1Z3ete8eGCfDlmamuDiWdDULQM4ISwniZMAYsImvexb1YQVDxbnbxrU4lpMPIpiC69lDDruU1FfGWwja7IKEZmA+OfBE0vby6EOSTCmvtJJM/T1AVQU1BeViAqfYGolqMm2JjBR7P56916YlR0UosILz8JiBDEDepzRNoXIlGh2Q1Sx+rGpAIqmi4FxZrWh8p4kvyMUknYNJ/5lLxOVO6vbcN4Y/s41iGWobg091+m+Ns7bGO4tRcaFUXvubjt5eTc1Fead/e4preo1MC/w5SAU21vL9MYe9+/BYN8Us7OOmy9wfKaKYDn160j+1t0tm9UDuCz1aa
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 0e2ea59c-2544-46dd-bea8-cfe1e3e26f3f
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 36515d32-5074-44e9-b5b0-0e693531b16d
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:56:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 09:56:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (2 ms)
================  Response End   ================

', '2026-09-20 09:56:10.04031', '36515d32-5074-44e9-b5b0-0e693531b16d', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490568688832516, '2026-09-20 09:56:00', '36515d32-5074-44e9-b5b0-0e693531b16d', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:56:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-09-20 09:56:00：[INFO] 任务描述：接口调度02
2026-09-20 09:56:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:56:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:56:10.045823', NULL, 14);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491072017895427, '2026-09-20 09:58:00', 'af17906e-027b-482f-86db-a9e12c3f84dd', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 09:58:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BEFAKOyr1o8qs3rmWRf23WvSp69BQGQb0mc9daJvu+lFT5YirQO/McFuGXkpRQCFEid8O9Ajmup056ZqXZVT+InN24VJOCND+mcxTNOpwBbb1yDTV5VobblC9MyUA0sH2a3hAfAeue8T9UWW5bZI/F/PSmZtpb2sqFACTmSx3zTMEax5/P+VsfmsWai//edPlP5Hj4bc32zmOLg7ilk1nDoMmZqECUsOP6egQo115EA1O0zroIQaDwQv7ec3w+ChL1IS7+QxEvhSkjP+4IidMo6ZvjikNSsSsa2tCiHT8AYj7v4MGldE3XV5jIZb7XIql7U+xa7/bHcH8K7SkA+L5zBbg+1X4q2wN8upM3Q2O2zW9+2FdY0sLeKy2/iT6EH239QR5T5oQSzImN6ncCbCN4OSChlPBJdNcoL7YQi64PbgmCMSXk8k5vNjR3K29A==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : af17906e-027b-482f-86db-a9e12c3f84dd
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : b9d50f4e-00f9-4ddb-999f-ec8c45576fe1
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:58:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 09:58:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-09-20 09:58:10.043412', 'b9d50f4e-00f9-4ddb-999f-ec8c45576fe1', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490820347072514, '2026-09-20 09:57:00', '973fc518-0aef-4163-b45c-d6a0c6bfaa2e', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 09:57:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BL7afaEuDaGX1OhqqIsIX/ap605mHpKGToxzI81OAeju2ITZTgS6A9AohO1mm60Ry/H+tW7PZ+xNUTeGKi6xRwOCYIIODK3oyD38xgIvijwXjbBW9Hokh1zWamBu5Bi7RsFy1Y7Oa9cCZncfYowI/mngKMVXSh0LK8kbH/QoLejkleWbrL0XXUkNN2UBJ+u7l0gw0OfJP10kfiaGOK+nSvh7nkBlVhOaZvhwZmIMyvJx1tzosKlFDWbr8hK9bHRnPtlb6WObosgYgc6h/uJv2zxHe9yOVmceSc5NsvfaGVSyELWrGCsQvpqzaRGKXpXDNRc6W3KxtUXuBi8uDNv3oV6Vhw3W3eIwKiUWLXgcqawHrWfW39vyETFHcjMgXKo8TBAheAae/m/gDeeCmJYbrnUS8j4+yh5UBrAs8QXImz4xaKDaWEevuy6z6IX+U/8ILX9B
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 973fc518-0aef-4163-b45c-d6a0c6bfaa2e
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 87dcc503-aa6b-4d62-b450-368f85c20a4e
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:57:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 09:57:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (2 ms)
================  Response End   ================

', '2026-09-20 09:57:10.040056', '87dcc503-aa6b-4d62-b450-368f85c20a4e', 5);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490820347072517, '2026-09-20 09:57:00', '87dcc503-aa6b-4d62-b450-368f85c20a4e', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:57:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-09-20 09:57:00：[INFO] 任务描述：接口调度02
2026-09-20 09:57:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:57:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:57:10.048573', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491072017895426, '2026-09-20 09:58:00', '447de8d6-ea60-4695-ac8d-464cdd7665e9', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 09:58:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BASWxdz4a6uMC9RrBgtmqW2ap5yV/ayVNKoDBrHnLajxkhZjrZ3aHR5zxqCYYKRthdMrYyZgdBszix5t0eNPz3U6cMdDdUFxuvMruWROIxwhBUVAvLctZMzknVECXfzQdMDK45S1ja7a5ogGhmssE/l1fSzSClymwBg3pvZcjKnPcgXvHXGHggAI6fNkKa77j5uTwze6uxIlkiJ6VoRvTM4zBPDJVXWUvgnV6O+R1zeSD900E3iUErZk0lo94qdMCFVLr/2RDHUU5CXNivd5tT+eAL2EIkSIdUSgOT90DqosHXXZJxVvIOUr+Kj85MVYxO3NUqynQvADnX1q0TaDFATGInJVLOJP6J2U6cBc2NAYr0x0d1wTHwcYrourwmB5LsWIH7hKmMFdo3Qd2YUySfSfbQVBgiapLg1Hz4vgGPItaGRTlrXlJJRgPnnV/v2R0Zb6
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 447de8d6-ea60-4695-ac8d-464cdd7665e9
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 97821550-68a9-455f-bb15-a69458455fe2
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:58:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 09:58:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 09:58:10.043412', '97821550-68a9-455f-bb15-a69458455fe2', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491072017895428, '2026-09-20 09:58:00', '97821550-68a9-455f-bb15-a69458455fe2', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:58:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-09-20 09:58:00：[INFO] 任务描述：接口调度02
2026-09-20 09:58:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:58:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:58:10.051928', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490820347072515, '2026-09-20 09:57:00', '82a45cee-9914-47a5-8c86-3837091ec9b1', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 09:57:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BM+cAHewsdr66yV5lphKftOh38aBcaQRDF4x+ha2RY+f3OYH8ivDZ08uX/B7jmMZlwXpyYxbRvRrdAC5htbFrHmfJohv4dUUTPAnJeSjE2gu0Mhxr5k9ap2RUGYNyjWDOlmhxJFLAJPFA80h8SkaHJGpF7j/bOeJwwnyw18WIuT2ZNta34DNlMuEv5EvDxMpx5LNlZKKeS932DKQeEU5VGnBAYBnaMbKac6lO8ovFgVAURQaaMPpYKCuj0YaNoGVIYpnQI71+WlS6z0iqm+9y1mA7MkZsDYMwgHEDxhFowe2yNyRF6eW9RT8gf5oAO1kRhgMiXTEDvMBGZeQ07Uo0GdX9JCU7JUqZxaIgxeaAP+nFW9GSQr/xpliRmUfQ5wbUBkQ4Zo9Xp64iR9ZN4djJtpnjpVXRzFnHGCjjH8UTk0We179Ut+TI2TyUJLE7Q==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 82a45cee-9914-47a5-8c86-3837091ec9b1
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 8e92c68f-c455-403d-a1d3-551cbe318776
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:57:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 09:57:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-09-20 09:57:10.040056', '8e92c68f-c455-403d-a1d3-551cbe318776', 5);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101490820347072516, '2026-09-20 09:57:00', '8e92c68f-c455-403d-a1d3-551cbe318776', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:57:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-09-20 09:57:00：[INFO] 任务描述：接口调度01
2026-09-20 09:57:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:57:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:57:10.046573', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491072017895425, '2026-09-20 09:58:00', 'b9d50f4e-00f9-4ddb-999f-ec8c45576fe1', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:58:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-09-20 09:58:00：[INFO] 任务描述：接口调度01
2026-09-20 09:58:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:58:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:58:10.043412', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491323671941123, '2026-09-20 09:59:00', '2bd9e44e-36e4-4733-8cb0-360b599c73fd', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 09:59:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJSq0yemdjmi5C7g2buemxefoUP1lRgo1u8CS8t9GpwUi7DYy4v2XqBnKOYXZUzuLK2P/nD8f79tZPXzmQUhn9hjv0X3VKnK749rNHCE/PBDQprUSbVatklCc6n3D+jD3QOb7uy36tOjI5ctZ3e4e+ndnY/5DVKuQhDJM3SKE1kuzFIH5/oueMq5AD7YHG8zW4IVk8B6Ip8BrAMjk+x1fwDg2DbEwNmGQaSPBzNqsGPD6BND9DtTy+mu/SjlwbGh5cMi0ND4TJBL7T4pno1r7zXmebxCNYKKVHJeuRtTALzIIEETUq9GQsVwJ/jTYGf5HpOrhifsvYrzC2D7hJTNTXSDfz0xJdSJHqXDOkeDz8iYORXDtRnaVl3P5sLffyba70ZBdMNTZPFQTSWaEOuO98pV+iR15uC3a07OLjOyc9TF2f0SbB+BsX3huMa9DiVmKRkF
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 2bd9e44e-36e4-4733-8cb0-360b599c73fd
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 7ce18aa5-4573-4a92-8912-da3daef9f991
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:59:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 09:59:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 09:59:10.042852', '7ce18aa5-4573-4a92-8912-da3daef9f991', 5);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491323671941125, '2026-09-20 09:59:00', '018fe1e7-785b-40db-84b2-2dfe197ec184', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:59:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-09-20 09:59:00：[INFO] 任务描述：接口调度01
2026-09-20 09:59:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:59:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:59:10.054024', NULL, 17);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491575267266561, '2026-09-20 10:00:00', '99b7c7fb-6c3e-486a-81dd-28fb25e18f7f', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:00:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-09-20 10:00:00：[INFO] 任务描述：接口调度01
2026-09-20 10:00:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:00:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:00:10.02798', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491826950672386, '2026-09-20 10:01:00', '9cb55b0e-0328-41bb-a157-dcb45d21e1bf', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:01:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-3 
2026-09-20 10:01:00：[INFO] 任务描述：接口调度02
2026-09-20 10:01:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:01:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:01:10.03361', NULL, 10);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492833575243779, '2026-09-20 10:05:00', '6e2625e3-b0fb-4652-a053-f40fd06c4424', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:05:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BBc/0+PQUHWlFkNxTFfrcTZ/Bt9vI5++jZxYDyoYDoUCsPIwcEumzTPI6BMRpEvriCZSZI0mdwlEQf91zQ+y2YohiLPso4U0OvaPu0RK6x8Wyb5YtIIIlWkKFT/pshJ7NgqaEYH4wKjUxxt7bTOnOWmjMgR3qp1eZWXhglBMharR1PTaDE+chFVyUAA6yDgNlr4FgWJGT1EdT9UkES3ZAX85QF9Nh/e5y6KtoDgjO6KXOduXWCmqT8XsV8LSBNloFqz6i3UvNfgp5Yw/RwG0Ef6OntkskXMkgg1B6lTZF8e7A/vn8dIH1PTseOeDD+31+m+GQtgLl30oYNw2lN9xv7+5fsJHx2yzm7DzlTAXfzcysLP9kbnS6cWbUlJV915o9EdNGMGtlCLebmvfDuSBXil76lLflzQTpKRbg0q7biD4HxEal3Ke7a3R3BNlOQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 6e2625e3-b0fb-4652-a053-f40fd06c4424
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 80ff3548-ec7b-42a9-a9ab-8356d9e148be
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:05:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:05:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:05:10.030691', '80ff3548-ec7b-42a9-a9ab-8356d9e148be', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493840170455043, '2026-09-20 10:09:00', 'ebadce27-4b19-4176-a8ca-2c6652414d39', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:09:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-09-20 10:09:00：[INFO] 任务描述：接口调度01
2026-09-20 10:09:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:09:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:09:10.026225', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494091937746946, '2026-09-20 10:10:00', 'e5f5f596-08a7-4467-baae-d57317ee35b9', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:10:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-13 
2026-09-20 10:10:00：[INFO] 任务描述：接口调度02
2026-09-20 10:10:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:10:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:10:10.049065', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491323671941122, '2026-09-20 09:59:00', '93171c19-3940-4937-9721-21cbbba32449', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 09:59:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BHv1xlG5y8RCH4pGOtLEebOD3iDk9nkwBr1acNnKk99i0okXymFW9YmhD7PVaoOJNfidhEx4I7DXZvWD3dBLDRCU6reaR7zQ/S1w3E9mPGJ7RbHlYSEGoDSSuCJTAKCRLXeZjo+cyjHxIOn3whNx/n7/1jfOKMsYKzpL87AQo6EWi8Jz+CJ9Pvd6u7LoHESkizG2VDdbzssd+pWWEWy0JcyBkpy8SrpmnuxxeOA3864DiTokpU9Ou8Zd7yBqC7fskF44LlaY8cSd1yf6l4at389Smb0fKNz/dD9bJDUo8X6R+76s1IRqRClxvkZyk5WF++jJl7wp0JQYd0iMwfprJsEDx08amIGpRP4gzBvDv6bNDKcfJei/5m1eEAylnwmV/djwlb9GGFxlMNRZZCJFtgpjrF/FDPZU6aQ4sfUe9efGL31yRHuTNXVUIRsALA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 93171c19-3940-4937-9721-21cbbba32449
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 018fe1e7-785b-40db-84b2-2dfe197ec184
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 09:59:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 09:59:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 09:59:10.042852', '018fe1e7-785b-40db-84b2-2dfe197ec184', 5);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491323671941124, '2026-09-20 09:59:00', '7ce18aa5-4573-4a92-8912-da3daef9f991', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 09:59:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-09-20 09:59:00：[INFO] 任务描述：接口调度02
2026-09-20 09:59:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 09:59:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 09:59:10.054024', NULL, 18);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491575267266562, '2026-09-20 10:00:00', 'b25942b2-2a27-4adb-bfb4-3d09bd935d50', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:00:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-3 
2026-09-20 10:00:00：[INFO] 任务描述：接口调度02
2026-09-20 10:00:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:00:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:00:10.02798', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491575267266563, '2026-09-20 10:00:00', '69666aa6-4267-4bf1-8225-2696bfa65be6', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:00:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BHRSTxWSMjDtW8s6wSacJ670kD17zvt6o76KjrC8YOqqeaCsIlqBZ8r73t1jMcwlKFRwN0+uGzc/TDOGcD+pnBaPzXVzFthyWnAcFGr5GZb4ypwVv6nwsDHxiWbExTrOlaoaWzOzGYazrxn1Pr4s40mrvhrZuIrZCgHRbbshAdSN1V0GFdX4qTOHD3YzXHXJpsUg1xxLLQRzGZKU98yZhA1EVXEze37WjfGv2EpCUKkGho4iRA5YCxy9rC5WVdKLuACN9qNqlikgfKF9OQQik9SKKlp09Y9AIlsLGlwe+iPC/tPnPSGa/4JAnbZzC6hcjAgOdYziodfpzHYYiDfD+MzegliluKFcjTL+Pg3dVurt6o0mOwCcmTQ2aLm0hKm18zo6p6Zd1adku+Y3EdJKqy8lkNORmc7NbYpplLbtUSdsXBvGR4s6bjFRea8CaXFh5Eu4
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 69666aa6-4267-4bf1-8225-2696bfa65be6
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : b25942b2-2a27-4adb-bfb4-3d09bd935d50
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:00:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:00:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:00:10.02798', 'b25942b2-2a27-4adb-bfb4-3d09bd935d50', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491826950672385, '2026-09-20 10:01:00', '573c64ba-a33f-487a-8e59-2fa1d9e8a003', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:01:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-7 
2026-09-20 10:01:00：[INFO] 任务描述：接口调度01
2026-09-20 10:01:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:01:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:01:10.03361', NULL, 10);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492833575243777, '2026-09-20 10:05:00', '4926d20e-22dd-4c5c-9209-5925fa418772', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:05:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJ5pV0mSleaNG+p1cieDYXWv/4GlaTMW7MzpZ5dkDD389IAiF8bVppydxpTPDkYnQ9MUaW4KuKuxD+Gdki3NElWl62r3a9nUlK/l9VYPrax4lwZjgmLUdgQbt/mx9vMz1lNw3aw27LA1MDHs7ndjsSqwBxfCxlOqplinyF2LJdugG6hjeD/3i/tkDC1/IszFUb+edtrIPXGJWcP3N1R3v3Umd98hwKlIHNFA//4sCnYzaF6dzxdpjt72PdLRboeDmYtERmfgpQURMXFLMwGUM0OiEYHIya4iSjv/IusCUQoJVG3sdrSOK6UoeRldeIw00KgJ6NIjPHYHrcELVquAKo7vMX1M7KbL/J+sYTuZF1frHNGWvUxmtb8mmjsDZ6cc5N7ytpaLILIZmQlgNkPilCwdHZa0hAaZ/V7pI46ATwizEO5vLt2tlhr07DCEv79ORsXO
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 4926d20e-22dd-4c5c-9209-5925fa418772
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 3745f7f4-143a-4fab-bc46-363db078f709
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:05:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:05:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:05:10.030691', '3745f7f4-143a-4fab-bc46-363db078f709', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493085183152130, '2026-09-20 10:06:00', '2fa102d0-5754-4500-b162-6b4d296730fc', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:06:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-6 
2026-09-20 10:06:00：[INFO] 任务描述：接口调度02
2026-09-20 10:06:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:06:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:06:10.019379', NULL, 1);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493336812032001, '2026-09-20 10:07:00', 'f4374a83-f9e5-470d-8b65-22f41717656a', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:07:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-13 
2026-09-20 10:07:00：[INFO] 任务描述：接口调度02
2026-09-20 10:07:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:07:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:07:10.011797', NULL, 0);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491575267266564, '2026-09-20 10:00:00', 'e713c099-ed1d-44ed-8099-33c36b77cda8', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:00:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BJAIR8zqpVz2Dw9Njoqp2uDEmdPkApKdx3F+HvWGdqVrwUG3shVmICw7IEnw29rUiPo6tnK2wNAZPP7TkqqoHMxXeTYdC8Xc4Gj+JIIzNTB5idEVvRRzAZQ3aivCUpk3gxiJ2ttyrVWDzmWE/PUcQtUofryCjwqorR6mVMyCnMmCMEKraolp3P79C/TS/VozVfM1M2kv2GyvZ08pYW7Uku5mUMSABVV6CfGBAKY2IBXDY/cUxGjZAzXVo+8RLp+b5L/M1ZO5PWSkhs4SKJQI2j2oy88M2r+oWAyTz/5IqHnjcifqEBgs4/1CDWuS5aNXean64yNIRO3KrHamLJb29OB999bKlWGym1NIg40nKXjrwQZn/fwRMFTjkjntSLzf9ZNCFj9hiRIm9XjhRHE5rktz7vbc4klwS4/l6B8w7TP3W/V+IIRjglFUc/NCQQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : e713c099-ed1d-44ed-8099-33c36b77cda8
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 99b7c7fb-6c3e-486a-81dd-28fb25e18f7f
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:00:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:00:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:00:10.02798', '99b7c7fb-6c3e-486a-81dd-28fb25e18f7f', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491826950672387, '2026-09-20 10:01:00', '525c169a-133b-4ec0-bb69-ff88048a9c8b', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:01:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BOCUYY4oa6vZBLHLEiMRzq5RflevaViSfbYx4s0b/6BU7DwK/5ZtBU2K7cNvQeUGO/FFG5nhp7DfYY5yd2XIi9Mj2yFKUa/FEB4BKaBhY1gA6qCDWzqKGr4WKfAjiBZ/FSU5NkQatIdzYt5+HQhVhYPYFiYJkw0UJH4EYOGB+hArAyYUXBTTmecj/WCX/4dU44js0kzero6qvQ6N37yXtvs0vECE+ok/6BhLwBVhYukUijgsoMGAxRJX/5D/EHiHrHHYFU70KKB1rMRacN/6c63ITN/PxBwHSfqOvw7BwBiFJxnGKwbt/4UO4hZi7pm2ZNxRAl6KbPC/VbxPNaJezcv8bpl3MDKF2puCD2x5FUd5j2FdX3GqPHBO9qZk3TQMNf5KEEw5CubrTWpHwfDvmYSmTRWCjFcNyLkSFv7tQS+y7ervbmDNUkrY3mvXeGtxC8sL
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 525c169a-133b-4ec0-bb69-ff88048a9c8b
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 9cb55b0e-0328-41bb-a157-dcb45d21e1bf
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:01:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:01:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:01:10.03361', '9cb55b0e-0328-41bb-a157-dcb45d21e1bf', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492078583746561, '2026-09-20 10:02:00', '585c61d7-ef74-4d81-b850-724c3f387422', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:02:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BOlQYUsA/7DBywKaVMFslWDifP426Wzuzkd+cvyuEX1NIM+TM9gTS/dD8uaIZZGz6ahdohZAUClU4zaoVJHocIJA6LxDMuGWbfyqIaunHNGW0kksatpcXdbsRGtWLbyiy4MJGFgXnNjQ0vuq9/A+ptGo/Sh0QHofU/KyMebSoZmsB+b23FkXVCN/g5Cs3DX4bOJOSfB2orlaN/7rvdBVpqz2tGY0REA0L60EbsvDMKl3UATZwxGM1jVo0vPqegG9uaRSqTkniZ/pkNkIlrSXQrD34KLwQWLBbiNGYo+RC16Mko8GAl8nsarDq2vIf+gY60/un+PS3/J4ycUtsTHSoOznz5hUW/XPl9rNZX324pRxKXDT4W9hw/55YX2izUSsjeUprN06MeLpanRiyimLAIGOpxaof3lMBzx5u+lAWvyr4cGARwFkwnfdfwwUIYso8biu
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 585c61d7-ef74-4d81-b850-724c3f387422
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 8bc66f0d-98dd-4701-8ab1-9219c6404bb9
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:02:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:02:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:02:10.026502', '8bc66f0d-98dd-4701-8ab1-9219c6404bb9', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492078604718081, '2026-09-20 10:02:00', 'f9dbb55c-d703-4e7d-9a2b-52f7da8e2ee3', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:02:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-9 
2026-09-20 10:02:00：[INFO] 任务描述：接口调度01
2026-09-20 10:02:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:02:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:02:10.034015', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492331206676482, '2026-09-20 10:03:00', '0bad1741-0ad1-4d4c-b682-f73e63ac1ff5', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:03:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-8 
2026-09-20 10:03:00：[INFO] 任务描述：接口调度01
2026-09-20 10:03:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:03:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:03:10.257965', NULL, 223);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492581954752516, '2026-09-20 10:04:00', 'dee2681f-4c59-408f-b09b-df7eafa786bc', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:04:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-10 
2026-09-20 10:04:00：[INFO] 任务描述：接口调度02
2026-09-20 10:04:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:04:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:04:10.051219', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492833575243778, '2026-09-20 10:05:00', '3745f7f4-143a-4fab-bc46-363db078f709', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:05:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-09-20 10:05:00：[INFO] 任务描述：接口调度02
2026-09-20 10:05:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:05:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:05:10.030691', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101491826950672388, '2026-09-20 10:01:00', '6295b2bb-9349-4c5e-9687-174cb2300146', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:01:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BJNxCG0riNkTFaqmlxesHBnJV6jO61ow/xWud2tORA9gKGqqV5lyucMQdXhwTxwOCSVrPRlhZ1nD3q7Z0ytbPP/pMxVBv9QGuj+iwOFcYQs23Wqkzz9Qrw2QW0cuv1YvaUtJ2ae9jowOKKC5M2f1rM4w5roaiAStuYjDfy9dXQMaDCJhbnOmNNDzjpumLtby3FzC5WYG77LcTEp5raQEWAaL0hSE2TzBosal/tYUEeZvNjJrX3yAwChUbQXWBX5FDk6PDmtVrIx8W60hP5wIxBUf1Jdx6GtbG/ppgk5xI+LPoG6u9thk31b/VuOAGzz0s+LFAy/vbbmmT0vntsiFa65QkcGOxQpOkeZsEPy3QhLKc62Y1tnQMNn6XUN+4wCfcuD41WNBnWbhWqAAu2yVGalrfkZGCh5HakHtuCdLQCnokDJUt632cnESPtO4sg==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 6295b2bb-9349-4c5e-9687-174cb2300146
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 573c64ba-a33f-487a-8e59-2fa1d9e8a003
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:01:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:01:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:01:10.03361', '573c64ba-a33f-487a-8e59-2fa1d9e8a003', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492078583746562, '2026-09-20 10:02:00', '962d7898-dc10-4d1d-9c54-aff7c0b28200', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:02:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BNVNzRyL6WoAoUUS25fxuCOi7FG/Kf5iyemYSVrH14H60NKX7H6E7z2UM+cpF9w4YxjVU6zf6HzSlrMfCp+iAiHQk8saoH9gVtj7YYbJBprxO4GI1AI1QHF3o1JG9LtXm5PHSOPBIsab/HuofrMDR8orMrRjP69rRQLjbhqMKeyBTF6zDcexTra4c/U9LTgjuj348oWFyY1/s04lvAdVY45Eb6WP+HgcSYL9BT2HfbcWcrErx8WQxwWfiO7Mk31omHrOt71jhF+2fqodCNk69te9mNlen/tocWCJNuaVTmHDNEaVP9X/7gcg7iLXdvd3hUcNqyzF4r95j8hygcm64lBGXik8X9EMyYaZBnOKtAbOzzbu3vJkLRWHjWCeaQ5FqtgvOkC7DFZ28D/l2KiYbMo1UdT0ytb3Gtyyh29tDcZZKM5r9GX3vPNnyWSuYA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 962d7898-dc10-4d1d-9c54-aff7c0b28200
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : f9dbb55c-d703-4e7d-9a2b-52f7da8e2ee3
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:02:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:02:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:02:10.026502', 'f9dbb55c-d703-4e7d-9a2b-52f7da8e2ee3', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492078604718082, '2026-09-20 10:02:00', '8bc66f0d-98dd-4701-8ab1-9219c6404bb9', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:02:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-09-20 10:02:00：[INFO] 任务描述：接口调度02
2026-09-20 10:02:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:02:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:02:10.034015', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492331206676483, '2026-09-20 10:03:00', '5b046f57-9b76-4d54-89e5-59a0bc8e0959', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:03:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-09-20 10:03:00：[INFO] 任务描述：接口调度02
2026-09-20 10:03:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:03:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:03:10.257965', NULL, 223);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492331206676484, '2026-09-20 10:03:00', 'e60b742f-1975-47d7-8b57-b43f92626091', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:03:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BGnT7maKLnFO/yehseqizfyLiRvMBHAUoPRP1p6JM7RmrMSutDsghYALQmrJtA39o2wU9T30bTebCmRPrbFngBX+XdwTECihHXDDEdXkDW8HBDyKyw0XoHOaLqyy1V9qSJiaVXFq6YV+iNAmhQR8fqnz6DVpOFHdlKPxuLJo8LzDcUGFd+uteH417+qWtncgZnMH1tDi8vzj0i8FPG5gEbL/uFEcC1BpKwcgINs5snGe5odC9ytiiFokwL+WjT9JDVZzQq1eEyLdqL+qUBOdH0WN3IHFfh+MN0tkwH1PYSyxL6Bz4WAosxcsgWG4fFTYf5qr4goNiy103MtSSlibeaI8SR05tac+rCWsWhvf/Bf4OzSxe3j0kpXwio8Pjtg+UAzgxU8GhiQC/LsN8m98iFoKrZ/ExIxfJgcwmKEN4+CGfVhr4BHKRr9lw6J6gQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : e60b742f-1975-47d7-8b57-b43f92626091
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 0bad1741-0ad1-4d4c-b682-f73e63ac1ff5
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:03:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:03:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (22 ms)
================  Response End   ================

', '2026-09-20 10:03:10.264478', '0bad1741-0ad1-4d4c-b682-f73e63ac1ff5', 147);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492331206676485, '2026-09-20 10:03:00', '0da65c0c-8292-4736-9fee-ed5485cb81ed', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:03:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BK9bYNUdcYfJOASTsNVczmBnzEQ5P2NVlj3ms7PPOnUl80JIOPz9tPYnWEybBljLGKBv2VNe9reFK8shuqil4nHX75Ff2iXxOoV7mgnTEseaKXpbChraRIZIkjJRWAXpsV+vfgQ+VK+ivCKoh1hrwuxTj8HRSUfHV0QjvMzEMkRnJlWenbFMTOiy1MjZgKLSSkTLZ9eeHmvU3hesgdfd7ADVkhBeySTltCDEvbiUYdf+STub5hWx5g5IS/r7k7b0YvSkIJxrXKGikfB6Q1W80uCt49dNbMqjoTCHiHc8rHp6GBw6gqjpCBkxgN094nyNLXVdxbXyoulL/QJNrPyCW2IMRoVDlrRworOHStfiCRcGolBsw6VPWg2vgueJMbkFP/8V+KXrN3fj2MqE6KU4YlICowBhzV/04qcWybhn3iTYOgPkB3sLS5fopHKBe2TyMLYp
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 0da65c0c-8292-4736-9fee-ed5485cb81ed
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 5b046f57-9b76-4d54-89e5-59a0bc8e0959
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:03:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:03:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (22 ms)
================  Response End   ================

', '2026-09-20 10:03:10.268478', '5b046f57-9b76-4d54-89e5-59a0bc8e0959', 147);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492581954752513, '2026-09-20 10:04:00', 'a46fdf31-107e-4a38-b228-264597a486f0', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:04:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BPLTbSl+Vr/A3BdH+XkVaCOPyEqpv+iAYsv44pjNLywc04p4IivZEpzThTKsjxU5JfDut1xeCktFnsSZrzfUtI1EQILQR5Yn/AqkZZn9k3pNmngken1JvdfBGpkyhhnY6sqjgZjH2JEtQ9ZnB51C0onjTLtVDpLzN5VxVhHttaxyI4QShwP7g4wXfFHv8YpPYKjKxErRIoz7kN/+5pm+LSjlpb9lIdRFMTsoc/t3NaUhKYdimxUNHdRsyaSlW6Kb5Qx+VGcTuy/i6KR696D2qZEVi4kZS853uE/+UhCl0Ww3ThlHI9/JViCSA7UOyuLstAsOE9dDoESaH796Y3ZbeoNOmXmf0xIddZXHq8NbfP3jaojSNBUIN8sApIBB6S9WdB3H6shPMYFOy4fdafVPmmxVj7MIjxzS+E3gVPkjmeA86oXs61EE9wCGn1chPJnCgIGg
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : a46fdf31-107e-4a38-b228-264597a486f0
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : dee2681f-4c59-408f-b09b-df7eafa786bc
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:04:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:04:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:04:10.039945', 'dee2681f-4c59-408f-b09b-df7eafa786bc', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492581954752514, '2026-09-20 10:04:00', '6c43ec90-9cc2-4e8e-b193-a20297c529dd', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:04:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BHmim8l4It3P50qIN7MKC/jy+SW4Eif/ZVhnYTW7445c/3jKSljaiyxZrKNXMxTGbmIq3DWGf04MxY6SwWjCJWd4rbroa5/643LSCxYg+wWx6O1WQ/VQziLwnBi1XykURarutp1kgc8bJI0oNFgyrkPFzz1jfgygQLSA4y9i7Z92tUFIe4BUbZV3ppvWil+DNMsLBaVK64gayLlUNOhi2T7W8kbYNmM66uTFgrLrpj1HrWVHncwqgii494CesUVtiQ18O39QxfkqwlBo8fK3ybk7yY2v5C9jtE8urM0/aYhfxEtXEvE+ssgcFIhn7G8/UBue7udy2wg/8nLRsEis5XTZUn4NkLQcTGTcC84xmga2xhFJQSZqmk7xxcqpy+lTq/AmwMyuTVzpt4zEFfsqlfWSYp+W9dOmy0l59LZeCYuCkpc0LuVfUgK2a+0IxA==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 6c43ec90-9cc2-4e8e-b193-a20297c529dd
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : c55c7b7d-121a-4ced-aa07-4294ab89caf4
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:04:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:04:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-09-20 10:04:10.04622', 'c55c7b7d-121a-4ced-aa07-4294ab89caf4', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492581954752515, '2026-09-20 10:04:00', 'c55c7b7d-121a-4ced-aa07-4294ab89caf4', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:04:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-2 
2026-09-20 10:04:00：[INFO] 任务描述：接口调度01
2026-09-20 10:04:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:04:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:04:10.051219', NULL, 12);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101492833575243780, '2026-09-20 10:05:00', '80ff3548-ec7b-42a9-a9ab-8356d9e148be', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:05:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-09-20 10:05:00：[INFO] 任务描述：接口调度01
2026-09-20 10:05:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:05:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:05:10.030691', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493085183152129, '2026-09-20 10:06:00', '280f8df0-ea63-4d57-b885-9086b8dd7ee0', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:06:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-09-20 10:06:00：[INFO] 任务描述：接口调度01
2026-09-20 10:06:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:06:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:06:10.019379', NULL, 1);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493336812032002, '2026-09-20 10:07:00', '40503f3d-6158-4925-aeb2-e5a538f77bee', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:07:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-09-20 10:07:00：[INFO] 任务描述：接口调度01
2026-09-20 10:07:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:07:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:07:10.011797', NULL, 0);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493588503826434, '2026-09-20 10:08:00', 'e2615217-614d-42b1-b071-f1d940a6e862', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:08:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-5 
2026-09-20 10:08:00：[INFO] 任务描述：接口调度01
2026-09-20 10:08:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:08:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:08:10.019793', NULL, 1);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493588503826433, '2026-09-20 10:08:00', '4c2eb497-5fed-46da-b686-825e92240aaf', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:08:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-13 
2026-09-20 10:08:00：[INFO] 任务描述：接口调度02
2026-09-20 10:08:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:08:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:08:10.019793', NULL, 1);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493840170455042, '2026-09-20 10:09:00', '27e96f29-b171-45ba-ad05-622880497da1', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:09:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BLO3iYyBmSZq6T8AL5Lsvj5K7hxzu+lEwbEfvhx6SZWZawQd+YDpPHEwORigV0tOqCe5gdnl5+HZ19Ne9F104pa+2yuZjlOA68wJDpV2V7fhTVrgrYIKwWbHtMjBmaKs320I0nIGDb/qUGQ6LoUZ8H24vhAdEkPOWV3OW0GsGyoLQUvWN+3nmv8rfxGcRWyWXaeJNb8QJNpbyQJ4+RisCWm9b4GxCc/yIx9UoNngeNYFnVzsohs+KOiPok96cIudNBgCtg79R7ckWOcFo2hk/7cUxSg2ikvb2RnRESJgs+j1E4MOQeh+XwJ0BVDKEqP6bfSg1ZRzkt2QX8dBvP7uK2KWH8Buo4hrytHDloQzrgtvF15QGR0H1+B7VXPf5oJCXgrE0HcxuFmxRXjiCh1ypvr95MnL6MRh8ENogbPSrAfKEfumVOE11Q7+sIfCug==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 27e96f29-b171-45ba-ad05-622880497da1
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ebadce27-4b19-4176-a8ca-2c6652414d39
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:09:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:09:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:09:10.021715', 'ebadce27-4b19-4176-a8ca-2c6652414d39', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493840170455044, '2026-09-20 10:09:00', '12305a97-67aa-455d-bff1-c7792d7d4e46', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:09:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BCjwmn3x/ofbB6lKeaDKD+Yt0XwNy3U1iDM0GNT0abSrI5LlG9N8Rf++xhNzwE/S4DvN+WKufMF2QhJFjMgpWTX7X30TC8XrVCmN4ux6x1uXuo7aykOLh5UKbYXR3r+kcPQ26SfLxuUdWvVl7sNwiNkyq70GuBcFHm+VqWOozIHFhMXYupLynpgVPrJ0IUyzll/FFCFYdVUwgVPIyTDnO/5qX+t5xoS3l4ND/yhX6gRNHdYJwrIiFcU+ZPnbrDwdrddtIsc7bSQAvtM9rKXzXdc43EcJOp9jedjSzwxzQHDRAoa5Dh/ZkRuHA0QEIFH39cGJZWnMkK2B5pAXtP3XJFIWhPLyE0ePVzgj+u+YNmnxNNj4+yn9GH1nVoMWqdSbMJ8kLeLIWuLiz5yi2R+DylWJb8oZ04XKPzh1jUPz/Uy43XPc8reZLKIf6KyuS8FKE+mK
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 12305a97-67aa-455d-bff1-c7792d7d4e46
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 0f2edc1c-8129-4ef2-848b-23540cd83d3e
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:09:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:09:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:09:10.026225', '0f2edc1c-8129-4ef2-848b-23540cd83d3e', 3);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494091937746948, '2026-09-20 10:10:00', '0979daf9-18d5-42ac-9212-3f4daced21ad', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:10:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BJvNCCv0uA4Zp7bSkcpIYiOIz9mAx4nI3pNhMtQATIVSYm4OALxk1PskHf2uQmONAiC0j2+Z2W3NwE9hXf/qB45jKiBWOxhWj26SlEwYSAOab4rW60kQuQxo7bCxZLipDhQVgTJZMUFCGXAFc2drPxTP76QRVhZOx6O1pwWEaz1QfSCCAMEZjeUqvwd4ANhr/XvAIzRWg0jmbeUpEShYGIQUHsALOGhLwzq09aJEQvkK1DypuETORsULU4wyVnDgutF4TC3Y0iWib4jI9WVOqtCuiYceGy4Ne6BRsCrp0KAIF3sGEeGYJ6QwrYqWQanrJpGwV8+FcegSHskSyGYFcHM/9Hja9jYVn8Zz3ZFxJbtDpZBNlPlDDn/qex67KgnYHRi4382GGcSCrF74NENnviplC+KKP5jrS6gxdAmSrhOVbZIDCCR3dr7MxycBow==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 0979daf9-18d5-42ac-9212-3f4daced21ad
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 981a3b05-43e9-47a0-a1de-d766ef25fdb3
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:10:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:10:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (2 ms)
================  Response End   ================

', '2026-09-20 10:10:10.049065', '981a3b05-43e9-47a0-a1de-d766ef25fdb3', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494343533072386, '2026-09-20 10:11:00', 'd6afebb4-5602-42fb-a333-62fcd6db7b9d', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule1', 'SUCCESS', '2026-09-20 10:11:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BOwi7srsb8EQund1wEUHsxWO4rqvt7v8Qyeiou/1rRFzPSaDC/UkfkGoM+6rrTgSLfGGk//hDExnXJtodh5Dif9VIJrwIUbCAJ++pBtNdlypREbkszijo0nmuT3ZE4yVPvznIAlwGbZyxPLCXw9SAwt6iHrkEyTzo0dulIOTsLwOaJO1CpY4FMRtkxGeJ51J6ikpYOyd+d/epDGICONi/KUW1saSnbGp/U7ZOKAkbUL47S1YoC/1KwdzAF/1C3vjKAjYFHVMpE6UceMPqE9KMB4NZyXMBQKwctJOrodJCvoxcNkKPJUcvJ3Lf2u5u9zvN8z02YN5cmh3Hk5pkQieGjYpkxxCkmkntZFFWl2q9uCxxWePQEoRPkCADmnzJi/yaMoWuslvGZObfxxI++mdvdFDo40dayctPHXzGQ/DGAUUK4r61bNcJPzrNiYyLQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : d6afebb4-5602-42fb-a333-62fcd6db7b9d
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 0a34f249-7226-4ffe-9093-497e61009a6c
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:11:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-09-20 10:11:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-09-20 10:11:10.032484', '0a34f249-7226-4ffe-9093-497e61009a6c', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101493840170455045, '2026-09-20 10:09:00', '0f2edc1c-8129-4ef2-848b-23540cd83d3e', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:09:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-13 
2026-09-20 10:09:00：[INFO] 任务描述：接口调度02
2026-09-20 10:09:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:09:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:09:10.026225', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494091937746949, '2026-09-20 10:10:00', '981a3b05-43e9-47a0-a1de-d766ef25fdb3', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:10:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-09-20 10:10:00：[INFO] 任务描述：接口调度01
2026-09-20 10:10:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:10:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:10:10.049065', NULL, 13);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494343533072388, '2026-09-20 10:11:00', '47a21afd-6f9a-4a0a-865f-c8089c515697', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:11:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BJp35HkoSr/eMeC250dgkJiVBPDl2iclGkeB/rFp9Aj/TNQjoiFjeoWy+EOvJvl7mLF7nOFwAR4QSQLOJo5PW1lMrPhh7/X2g7pXdGKjBV17FLpBuegGnrqmsRI+qiByah36GXUEUqjKM6X4iukltMRsNuVfytXeoO0KXUj+usMoBIVMsOTeHeynG9QXDlhanIEuVkWtQ314ZbHM+qqZeEaGXozymo7Ec95PmMSKCX2koAyQSn7b5HbdwDOo4cSwEsLc/TbNRi1QPu3sLrNdL/AjQtfsL9UVSf5vLTtmYvV+kaQC5BkooueZywTr+7cQy+qmxPYdzthM0FEWzS7z5aLU7PvoH55SPPVtFRkbeEURc0B1wtauPKTNR2sZTPqez6ibmKt0dcd8iUBUB+tSp+X/xB8UgEd4cLwqq+jNxP7zFRwa804cdPl05jdSzrwAgYcC
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 47a21afd-6f9a-4a0a-865f-c8089c515697
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 5b1df999-e313-48f7-ab8c-250cf654e04e
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:11:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:11:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-09-20 10:11:10.038394', '5b1df999-e313-48f7-ab8c-250cf654e04e', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494343533072389, '2026-09-20 10:11:00', '0a34f249-7226-4ffe-9093-497e61009a6c', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:11:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-0 
2026-09-20 10:11:00：[INFO] 任务描述：接口调度01
2026-09-20 10:11:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:11:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:11:10.042393', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494091937746947, '2026-09-20 10:10:00', '2b0972ea-1df8-4901-a8b3-5e889369713e', 'module-system', 'http://172.21.16.1:8101/demo/testSchedule2', 'SUCCESS', '2026-09-20 10:10:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BBRPo2jU6ML+enEsHVV0yeEe+nHGTs6MsLm7DhqLIwO/sKMlgdk4KyWubNaLc5m99jBORUVFureHkt2uDJ9SU/aJn3X5VgsM6mBBsii5EuMfx/zYSpDS5AXv0BjNUldmQOxdRNmRbdelvX93ABAnkDjlCn9GMieUM6Pgv4kqi0MFZvzal5y3NNe1uLZM/9D3YNvb4Tgm44+1oytU5+ovMCRHvUjDFyS4gZ4l1i8nxnAbkVtyUoP9iFDKFtLn9z/DjKYurMFS4CzJUCq1Mgmo0uijQv5A7O771mf5Rrgm0JSCPjPseTb1GPiQlmQCeisG2Q4CgHzANult4Ovsme/DsOd9GOPO/On7WVY+Xc39uR0GmyeI0x+T2a2pxSn26fcAdyTuIOKoKwMd1XfhvMq5gQjkznxpfcTbfv4AzrNZpYrvjzyqRTM1EQAcfo7dy3FM54hl
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 2b0972ea-1df8-4901-a8b3-5e889369713e
===Headers===  Host : 172.21.16.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : e5f5f596-08a7-4467-baae-d57317ee35b9
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-09-20 10:10:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-09-20 10:10:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (2 ms)
================  Response End   ================

', '2026-09-20 10:10:10.049065', 'e5f5f596-08a7-4467-baae-d57317ee35b9', 4);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2101494343533072387, '2026-09-20 10:11:00', '5b1df999-e313-48f7-ab8c-250cf654e04e', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-09-20 10:11:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-4 
2026-09-20 10:11:00：[INFO] 任务描述：接口调度02
2026-09-20 10:11:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-09-20 10:11:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-09-20 10:11:10.037389', NULL, 11);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081641530036695041, '2026-07-27 15:23:00', 'dffd7de2-db8d-47dc-b666-970f7bbd857b', 'module-scheduling', '/demo/testSchedule1?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:23:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-1 
2026-07-27 15:23:00：[INFO] 任务描述：接口调度01
2026-07-27 15:23:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:23:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:23:10.329327', NULL, 134);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081642534916435973, '2026-07-27 15:27:00', '3ff06705-0793-4b55-88f7-e4f9984da849', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule2', 'SUCCESS', '2026-07-27 15:27:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule2 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  TEST-HEADER : test header params
===Headers===  Accept : */*
===Headers===  payload : BN7A+a5R7mP9/JdPti/M81gz8+utfXMEONxPJxEwqk5Ku2SoMbSpt+oJScyY9BekfFLzNO+DjopNJ+/G3P0V9nxiM8+IqKya8FxNa7vxJcAgdoBn3ZRWZHzO6kXQVPfkx8C3PUNQHuNWXGP1nGZjoQzDvhvdmzia+PJbzQitXVygY5mMkbAjqFqe7w2Dfjbe2Y7rQyZsIVOTrUOiDoCPp23U9XYlMej9KA5+5OfG9ksp0CQiQk/Wurb/YFDTH/t0gtKCh4cSNqyiUqh0QqKrVK9ORkvUG5/9R48Uk+8xK86pHFiYMh+fSTFdrKIaIgge0/wkQiXuhtTI7DHyDYSUfSFh/+0tus9Io/jBOX/hxm0RkJvCEolKFHvjkuv+V9uNRZOQR/R8Qkrdmpf/B8fXCJ/NQ4+RdXlRhWchxJ/DkBLQW/wiOCnrs72ITK0J95t/rVJS
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : 3ff06705-0793-4b55-88f7-e4f9984da849
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : 281bb32b-7527-4e2e-862f-2f5ab3d22852
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule2?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:27:00：[INFO] 任务调度测试任务2, 当前用户: root
2026-07-27 15:27:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule2 (1 ms)
================  Response End   ================

', '2026-07-27 15:27:10.03063', '281bb32b-7527-4e2e-862f-2f5ab3d22852', 2);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643289891155973, '2026-07-27 15:30:00', '52ae8c87-0322-41b5-9bfc-b38d69e985ef', 'module-scheduling', '/demo/testSchedule2?param1=1&param2=2', 'SUCCESS', '2026-07-27 15:30:00：[INFO] serviceApiTask => 当前线程名称 Scheduler-8 
2026-07-27 15:30:00：[INFO] 任务描述：接口调度02
2026-07-27 15:30:00：[INFO] >>>>>> 服务接口定时任务开始 >>>>>> 
2026-07-27 15:30:00：[INFO] >>>>>> 服务接口定时任务结束 >>>>>> 
', '2026-07-27 15:30:10.038976', NULL, 15);
INSERT INTO "public"."scheduled_log_centralized" VALUES (2081643541511647234, '2026-07-27 15:31:00', 'b217c857-c88f-4113-939c-faf99ef1eea5', 'module-system', 'http://172.24.144.1:8101/demo/testSchedule1', 'SUCCESS', '2026-07-27 15:31:00：[DEBUG] 

================  Request Start  ================
===> POST: /demo/testSchedule1 Parameters: {"params":{"param1":"1","param2":"2"},"Array:":"{\"birthday\":\"2026-04-03\",\"isMarried\":true,\"address\":\"中国\",\"sex\":\"男\",\"name\":\"test\",\"weight\":80.5,\"age\":18,\"isStudent\":false,\"hobby\":{\"0\":\"football\",\"1\":\"basketball\"},\"height\":1.8}"}
===Headers===  Feign-Scheduled-Module : module-scheduling
===Headers===  Accept : */*
===Headers===  payload : BPFF3Z1K6h7J0RtUeuCal1jvKjMU7rQBdywC0YkclpfbT9h1nUAj+n1jcApcNTlfHItoh0ak6xaZktXtUDEknyWchCwdGGPqJQEKhzFsctCEb5LJvvy5W06s2PS3z/+myEJ5/zr0iiZpaGJTF+zz2vLTY2fdKw0JGIdDtasE/JilnPXqSUW4ju41n55wif7Kt9+TBblYocBusJyyDbwyytYaRAqjrMTQiYYPy9sY8scTDJYwDO2cevmq4PTN01OnIFM/M+YFFo6OQ8UJQy4haMSNOIrT7bJm1f+xpq1ZClv0NzRW1RkLIIHJTbJWGsZuZbnuI9GAoSlVgev5HBGQH/noApiVdsNysvpF1gDYBOD8m29bjlM9hjWfhCBgDGBfZe6Hf/JQGyjKHoOg3T9Q4agTeAO/sVIhMZJLncV0ErRxgzWNYO2LQ+lP8rFuwQ==
===Headers===  User-Agent : Java/21.0.7
===Headers===  Connection : keep-alive
===Headers===  Feign-Run-Id : b217c857-c88f-4113-939c-faf99ef1eea5
===Headers===  Host : 172.24.144.1:8101
===Headers===  Feign-Scheduled-Parent-Run-Id : ff06b699-a82f-4d86-825e-8270b2113edd
===Headers===  Content-Length : 183
===Headers===  Feign-Scheduled-Method : /demo/testSchedule1?param1=1&param2=2
===Headers===  Content-Type : application/json
================  Request End   ================

2026-07-27 15:31:00：[INFO] 任务调度测试任务1, 当前用户: admin
2026-07-27 15:31:00：[DEBUG] 

================  Response Start  ================
<=== POST: /demo/testSchedule1 (1 ms)
================  Response End   ================

', '2026-07-27 15:31:10.02214', 'ff06b699-a82f-4d86-825e-8270b2113edd', 3);

-- ----------------------------
-- Table structure for scheduled_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."scheduled_task";
CREATE TABLE "public"."scheduled_task" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default",
  "unique_key" int8,
  "task_key" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cron" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "auto_start" int2 NOT NULL,
  "sort" int4 NOT NULL,
  "params" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."scheduled_task"."id" IS '主键';
COMMENT ON COLUMN "public"."scheduled_task"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."scheduled_task"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."scheduled_task"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."scheduled_task"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."scheduled_task"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."scheduled_task"."tenant_id" IS '租户id';
COMMENT ON COLUMN "public"."scheduled_task"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."scheduled_task"."task_key" IS '任务键';
COMMENT ON COLUMN "public"."scheduled_task"."description" IS '任务描述';
COMMENT ON COLUMN "public"."scheduled_task"."cron" IS 'cron 表达式';
COMMENT ON COLUMN "public"."scheduled_task"."auto_start" IS '是否自动启动(1 是 0 否)';
COMMENT ON COLUMN "public"."scheduled_task"."sort" IS '排序';
COMMENT ON COLUMN "public"."scheduled_task"."params" IS '任务启动参数';
COMMENT ON TABLE "public"."scheduled_task" IS '调度任务';

-- ----------------------------
-- Records of scheduled_task
-- ----------------------------
INSERT INTO "public"."scheduled_task" VALUES (1972125945096101889, 1, '2025-09-28 10:27:20.302424', 1, '2025-09-29 14:11:18.253906', 0, '000000', 1972125945096101889, 'demo1', '测试任务1', '0/30 * * * * ?', 0, 1, '{
    "tenantId": "000000",
    "toUserId": "1",
    "message": "测试消息"
}');
INSERT INTO "public"."scheduled_task" VALUES (1972199489284993025, 1, '2025-09-28 15:19:34.608932', 1, '2025-09-29 14:11:20.046253', 0, '000000', 0, 'demo2', '测试任务2', '0/15 * * * * ?', 0, 2, '{
    "tenantId": "000000",
    "toUserId": "1",
    "message": "测试消息"
}');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "id" int8 NOT NULL,
  "create_user" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 NOT NULL,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default" NOT NULL,
  "unique_key" int8 DEFAULT 0,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "full_name" varchar(100) COLLATE "pg_catalog"."default",
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "pid" int8,
  "pid_all" varchar(1000) COLLATE "pg_catalog"."default",
  "type" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_dept"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dept"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dept"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_dept"."tenant_id" IS '租户id';
COMMENT ON COLUMN "public"."sys_dept"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '部门名';
COMMENT ON COLUMN "public"."sys_dept"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dept"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dept"."full_name" IS '全称';
COMMENT ON COLUMN "public"."sys_dept"."code" IS '部门，组织机构代码';
COMMENT ON COLUMN "public"."sys_dept"."pid" IS '父 id';
COMMENT ON COLUMN "public"."sys_dept"."pid_all" IS '所有的父 id（可以多级）';
COMMENT ON COLUMN "public"."sys_dept"."type" IS '部门类型';
COMMENT ON TABLE "public"."sys_dept" IS '部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES (0, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '占位', 0, '占位', '占位', '0', NULL, NULL, '1');
INSERT INTO "public"."sys_dept" VALUES (1, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '顶级部门', 0, '顶级部门', '顶级部门', '1', 0, '0', '1');
INSERT INTO "public"."sys_dept" VALUES (2, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '二级部门', 0, '二级部门', '二级部门', '2', 1, '0,1', '3');
INSERT INTO "public"."sys_dept" VALUES (3, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '三级部门', 0, '三级部门', '三级部门', '3', 2, '0,1,2', '3');
INSERT INTO "public"."sys_dept" VALUES (4, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '四级部门', 0, '四级部门', '四级部门', '4', 3, '0,1,2,3', '3');
INSERT INTO "public"."sys_dept" VALUES (5, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '五级部门', 0, '五级部门', '五级部门', '5', 4, '0,1,2,3,4', '3');
INSERT INTO "public"."sys_dept" VALUES (6, 1, '2024-08-31 15:52:34', NULL, '2024-08-31 15:52:38', 0, '000000', 0, '六级部门', 0, '六级部门', '六级部门', '6', 5, '0,1,2,3,4,5', '3');
INSERT INTO "public"."sys_dept" VALUES (1943511731406491650, 1, '2025-07-11 11:24:40.134908', 1, '2025-07-11 11:57:22.056', 1, '000000', 1943511731406491650, '三级二', 1, '三级第二个部门', '三级第二个部门', '0302', 2, '0,1,2', '3');
INSERT INTO "public"."sys_dept" VALUES (1943519889076113410, 1, '2025-07-11 11:57:05.069084', 1, '2025-07-11 11:57:13.724', 1, '000000', 1943519889076113410, 'ggg', 0, 'ggg', 'ggg', 'ggg', 1943511912596230146, '0,1,2,1943511731406491650,1943511912596230146', '3');
INSERT INTO "public"."sys_dept" VALUES (1943511912596230146, 1, '2025-07-11 11:25:23.32695', 1, '2025-07-11 11:25:23.32695', 1, '000000', 0, '三级二一', 0, '第级第二个部门的第一个子部门', '第级第二个部门的第一个子部门', '030201', 1943511731406491650, '0,1,2,1943511731406491650', '3');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "dict_code" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_key" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_val" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "sort" int4,
  "css_class" varchar(128) COLLATE "pg_catalog"."default",
  "status_class" varchar(128) COLLATE "pg_catalog"."default",
  "unique_key" int8
)
;
COMMENT ON COLUMN "public"."sys_dict"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_dict"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dict"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_dict"."dict_code" IS '类型';
COMMENT ON COLUMN "public"."sys_dict"."dict_key" IS '键 例：1';
COMMENT ON COLUMN "public"."sys_dict"."dict_val" IS '值 例：男';
COMMENT ON COLUMN "public"."sys_dict"."status" IS '是否可用 1可用、0不可用';
COMMENT ON COLUMN "public"."sys_dict"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dict"."css_class" IS '样式名';
COMMENT ON COLUMN "public"."sys_dict"."status_class" IS '状态类型';
COMMENT ON COLUMN "public"."sys_dict"."unique_key" IS '逻辑唯一键';
COMMENT ON TABLE "public"."sys_dict" IS '字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "public"."sys_dict" VALUES (1539854335129067522, 1, '2022-06-23 14:14:17', 1, '2022-09-23 16:29:22', 1, 'system-gender', '0', '男', 1, '', 0, '', '', 1573228430524596226);
INSERT INTO "public"."sys_dict" VALUES (1539854373901213697, 1, '2022-06-23 14:14:27', 1, '2022-09-23 16:29:27', 1, 'system-gender', '1', '女', 1, '', 1, '', '', 1573228450313322497);
INSERT INTO "public"."sys_dict" VALUES (1539854964199170050, 1, '2022-06-23 14:16:47', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'authorization_code', '授权码', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855052321497090, 1, '2022-06-23 14:17:08', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'implicit', '简化模式', 1, '', 1, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855691554398210, 1, '2022-06-23 14:19:41', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'password', '密码模式', 1, '', 2, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855762152923138, 1, '2022-06-23 14:19:57', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'client_credentials', '客户端模式', 1, '', 3, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855829513445377, 1, '2022-06-23 14:20:14', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'refresh_token', '刷新 token 令牌', 1, '', 4, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855965161431041, 1, '2022-06-23 14:20:46', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'wechat_qr_code', '微信二维码', 1, '', 6, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1539856069738012673, 1, '2022-06-23 14:21:11', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'sms', '手机号(短信)', 1, '', 7, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1570619878492454913, 1, '2022-09-16 11:45:34', 1, '2022-09-23 16:26:11', 0, 'user-type', '00', '系统用户', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1571756343934873601, 1, '2022-09-19 15:01:29', 1, '2022-09-23 16:26:11', 0, 'menu-type', 'M', '目录', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1571756398519545858, 1, '2022-09-19 15:01:42', 1, '2022-09-23 16:26:11', 0, 'menu-type', 'C', '菜单', 1, '', 1, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1572496927817646082, 1, '2022-09-21 16:04:18', 1, '2022-09-23 16:26:11', 0, 'system-is', 'true', '是', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1572497045488844801, 1, '2022-09-21 16:04:46', 1, '2022-09-23 16:26:11', 0, 'system-is', 'false', '否', 1, '', 1, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1573228332004589570, 1, '2022-09-23 16:30:38', 1, '2022-09-23 16:29:04', 1, 'system-gender', '3', '未知', 1, '', 0, '', '', 1573228352636370946);
INSERT INTO "public"."sys_dict" VALUES (1573228535860346881, 1, '2022-09-23 16:31:27', 1, '2022-09-23 16:31:27', 0, 'system-gender', '1', '男', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1573229306135887873, 1, '2022-09-23 16:34:30', 1, '2022-09-23 16:34:30', 0, 'system-gender', '2', '女', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1579411248996839425, 1, '2022-10-10 17:59:20', 1, '2022-10-10 18:35:54', 0, 'notice-type', '1', 'userId', 1, '使用 userId 关联了用户的数据', 0, '', 'warning', 0);
INSERT INTO "public"."sys_dict" VALUES (1579412543744929794, 1, '2022-10-10 18:04:29', 1, '2022-10-10 18:36:04', 0, 'notice-type', '2', 'roleId', 1, '使用了 roleId 参数关联了角色的数据', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1640961624411418625, 1, '2023-03-29 14:18:33.507', 1, '2023-03-29 14:18:33.508', 0, 'user-type', '03', '微信用户', 1, '', 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1570619926655647745, 1, '2022-09-16 11:45:46', 1, '2023-03-29 14:21:39.053', 0, 'user-type', '01', '临时用户', 1, '', 1, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1640968617578713090, 1, '2023-03-29 14:46:20.806', 1, '2023-03-29 14:46:20.807', 0, 'user-type', '04', '外来用户', 1, '', 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1668869050355597314, 1, '2023-06-14 14:32:42.348', 1, '2023-06-14 14:32:42.348', 0, 'is', '1', '是', 1, '', 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1668869084832776194, 1, '2023-06-14 14:32:50.568', 1, '2023-06-14 14:32:50.568', 0, 'is', '0', '否', 1, '', 1, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652455565914113, 1, '2023-07-11 14:28:27.92', 1, '2023-07-11 14:28:27.92', 0, 'lf_node_type', 'custom-node-start', '开始节点', 1, '', 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652511895416834, 1, '2023-07-11 14:28:41.349', 1, '2023-07-11 14:28:41.349', 0, 'lf_node_type', 'custom-node-user', '用户任务', 1, '', 1, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652564928196609, 1, '2023-07-11 14:28:53.992', 1, '2023-07-11 14:28:53.992', 0, 'lf_node_type', 'custom-node-service', '系统任务', 1, '', 2, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652638152355842, 1, '2023-07-11 14:29:11.451', 1, '2023-07-11 14:29:11.451', 0, 'lf_node_type', 'custom-node-judgment', '条件判断', 1, '', 3, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652695337496577, 1, '2023-07-11 14:29:25.085', 1, '2023-07-11 14:29:25.085', 0, 'lf_node_type', 'custom-node-end', '结束节点', 1, '', 4, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1678652766699384834, 1, '2023-07-11 14:29:42.099', 1, '2023-07-11 14:29:42.099', 0, 'lf_node_type', 'custom-group', '分组', 1, '', 5, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1539855889231945730, 1, '2022-06-23 14:20:28', 1, '2022-09-23 16:26:11', 0, 'authorized-grant-type', 'taybct', '同步密码模式', 1, '', 5, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1633006373893042178, 1, '2023-03-07 15:27:13.981285', 1, '2023-03-07 15:27:13.982937', 0, 'authorized-grant-type', 'taybct_refresh', 'taybct_refresh', 1, '', 0, '', '', 0);
INSERT INTO "public"."sys_dict" VALUES (1679680520972615681, 1, '2023-07-14 10:33:37.811', 1, '2025-07-17 16:52:35.030509', 0, 'lf_process_type', 'normal', '普通流程', 1, '', 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1538729077403729921, 1, '2022-06-20 11:42:55', 1, '2025-07-18 11:52:39.294871', 0, 'system-status', '0', '禁用', 1, '', 1, '', 'danger', 0);
INSERT INTO "public"."sys_dict" VALUES (1538729015877484545, 1, '2022-06-20 11:42:40', 1, '2025-07-18 11:52:45.974772', 0, 'system-status', '1', '启用', 1, '', 0, '', 'success', 0);
INSERT INTO "public"."sys_dict" VALUES (1964007849411747841, 1, '2025-09-06 00:48:55.458958', 1, '2025-09-06 00:48:55.459958', 0, 'lf_form_type', 'form', '表单', 1, NULL, 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1960154603698368513, 1, '2025-08-26 09:37:30.095657', 1, '2025-08-26 09:37:30.095657', 0, 'notice-topic', 'SYS_NOTICE', '系统通知', 1, NULL, 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1960154704332304385, 1, '2025-08-26 09:37:54.096884', 1, '2025-08-26 09:38:01.372155', 0, 'notice-topic', 'SYS_MESSAGE', '系统消息', 1, NULL, 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1960154806581047297, 1, '2025-08-26 09:38:18.467045', 1, '2025-08-26 09:38:18.467045', 0, 'notice-topic', 'SYS_TODO', '系统待办', 1, NULL, 0, ' ', ' ', 0);
INSERT INTO "public"."sys_dict" VALUES (1964008370499493889, 1, '2025-09-06 00:50:59.696286', 1, '2025-09-08 14:33:08.52568', 0, 'lf_form_type', 'component', '组件', 1, NULL, 0, ' ', ' ', 0);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "title" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_code" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "unique_key" int8
)
;
COMMENT ON COLUMN "public"."sys_dict_type"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict_type"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_dict_type"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dict_type"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_dict_type"."title" IS '标题';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_code" IS '代码';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '是否可用 1可用、0不可用';
COMMENT ON COLUMN "public"."sys_dict_type"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_type"."unique_key" IS '逻辑唯一键';
COMMENT ON TABLE "public"."sys_dict_type" IS '字段类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO "public"."sys_dict_type" VALUES (1539853897667354625, 1, '2022-06-23 14:12:33', 1, '2022-09-23 16:26:04', 0, '性别', 'system-gender', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1539854788155842562, 1, '2022-06-23 14:16:05', 1, '2022-09-23 16:26:04', 0, '客户端授权模式', 'authorized-grant-type', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1570614325850521601, 1, '2022-09-16 11:23:31', 1, '2022-09-23 16:26:04', 0, '用户类型', 'user-type', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1571756222585270273, 1, '2022-09-19 15:01:00', 1, '2022-09-23 16:26:04', 0, '菜单类型', 'menu-type', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1572496669654040577, 1, '2022-09-21 16:03:16', 1, '2022-09-23 16:26:04', 0, '系统断言', 'system-is', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1579408522250448898, 1, '2022-10-10 17:48:30', 1, '2022-10-10 17:48:30', 0, '通知类型', 'notice-type', 1, '通知类型', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1668869003685576706, 1, '2023-06-14 14:32:31.218', 1, '2023-06-14 14:32:31.218', 0, '是否', 'is', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1678652327878717442, 1, '2023-07-11 14:27:57.476', 1, '2023-07-11 14:27:57.476', 0, '流程节点类型', 'lf_node_type', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1679680386712944641, 1, '2023-07-14 10:33:05.801', 1, '2025-07-17 16:52:35.04473', 0, '流程类型', 'lf_process_type', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1537328288877662209, 1, '2022-06-16 14:56:41', 1, '2025-07-18 11:52:39.299656', 0, '系统状态', 'system-status', 1, '', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1960154447280189441, 1, '2025-08-26 09:36:52.80263', 1, '2025-08-26 09:36:52.80263', 0, '通知主题（类型）', 'notice-topic', 1, '区分通知/消息/待办等通知的类型', 0);
INSERT INTO "public"."sys_dict_type" VALUES (1964007608625143810, 1, '2025-09-06 00:47:58.051979', 1, '2025-09-06 00:47:58.051979', 0, '流程表单类型', 'lf_form_type', 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_file";
CREATE TABLE "public"."sys_file" (
  "id" int8 NOT NULL,
  "path" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "upload_time" timestamp(6) NOT NULL,
  "upload_user" int8,
  "update_time" timestamp(6) NOT NULL,
  "linked" int2 NOT NULL,
  "linked_table" varchar(100) COLLATE "pg_catalog"."default",
  "linked_table_id" int8,
  "is_deleted" int2 NOT NULL,
  "manage_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "file_type" varchar(255) COLLATE "pg_catalog"."default",
  "update_user" int8,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_file"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_file"."path" IS '文件名（路径）';
COMMENT ON COLUMN "public"."sys_file"."upload_time" IS '上传时间';
COMMENT ON COLUMN "public"."sys_file"."upload_user" IS '上传人';
COMMENT ON COLUMN "public"."sys_file"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_file"."linked" IS '是否在使用中';
COMMENT ON COLUMN "public"."sys_file"."linked_table" IS '关联的表';
COMMENT ON COLUMN "public"."sys_file"."linked_table_id" IS '关联的表的 id';
COMMENT ON COLUMN "public"."sys_file"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_file"."manage_type" IS '文件管理服务器类型（local,oss,fdfs,minio）';
COMMENT ON COLUMN "public"."sys_file"."file_type" IS '文件类型';
COMMENT ON COLUMN "public"."sys_file"."update_user" IS '更新人';
COMMENT ON COLUMN "public"."sys_file"."tenant_id" IS '租户id';
COMMENT ON TABLE "public"."sys_file" IS '文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO "public"."sys_file" VALUES (1968197430646771713, '/2025/09/17/7cde326c747b4708b26d55810ab6b58b.png', '2025-09-17 14:16:49.477207', 1, '2025-09-17 14:16:49.477207', 0, NULL, NULL, 0, 'local', 'png', 1, NULL);
INSERT INTO "public"."sys_file" VALUES (1968197620992675841, '/2025/09/17/3f3d0e9ea16b40ea90543e85dfa2b7fa.png', '2025-09-17 14:17:34.848572', 1, '2025-09-17 14:17:34.848572', 0, NULL, NULL, 0, 'local', 'png', 1, NULL);
INSERT INTO "public"."sys_file" VALUES (1969954430866968578, '/2025/09/22/559ee50d2d3640ddbb2f468612d22323.docx', '2025-09-22 10:38:30.973013', 1, '2025-09-22 10:38:30.977184', 0, NULL, NULL, 0, 'local', NULL, 1, NULL);
INSERT INTO "public"."sys_file" VALUES (1969958015533072385, '/2025/09/22/68b86331dd154e22a0cf98562838abb0.docx', '2025-09-22 10:52:45.619617', 1, '2025-09-22 10:52:45.619617', 0, NULL, NULL, 0, 'local', 'zip', 1, NULL);
INSERT INTO "public"."sys_file" VALUES (1980928625595760641, '/2025/10/22/b885903c47934d2d9761acc1fd3a463f.png', '2025-10-22 17:26:02.880162', 1, '2025-10-22 17:26:02.881673', 0, NULL, NULL, 0, 'local', 'png', 1, NULL);
INSERT INTO "public"."sys_file" VALUES (2029041219371835394, '2026/03/04/31e360154477492caaaa0cd879d280df.jpg', '2026-03-04 11:48:19.123413', 1945059926271860737, '2026-03-04 11:48:19.125945', 0, NULL, NULL, 0, 'rustfs', 'jpg', 1945059926271860737, NULL);

-- ----------------------------
-- Table structure for sys_history_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_history_record";
CREATE TABLE "public"."sys_history_record" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "table_name" varchar(100) COLLATE "pg_catalog"."default",
  "primary_key" varchar(32) COLLATE "pg_catalog"."default",
  "json_data" json,
  "operate_type" int2,
  "primary_value" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_history_record"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_history_record"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_history_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_history_record"."table_name" IS '表名';
COMMENT ON COLUMN "public"."sys_history_record"."primary_key" IS '主键名';
COMMENT ON COLUMN "public"."sys_history_record"."json_data" IS '历史记录（JSON）';
COMMENT ON COLUMN "public"."sys_history_record"."operate_type" IS '操作类型（修改2，删除3）';
COMMENT ON COLUMN "public"."sys_history_record"."primary_value" IS '主键值';
COMMENT ON TABLE "public"."sys_history_record" IS '历史记录表';

-- ----------------------------
-- Records of sys_history_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8,
  "always_show" int2,
  "props" varchar(500) COLLATE "pg_catalog"."default",
  "sort" int4,
  "route_name" varchar(32) COLLATE "pg_catalog"."default",
  "route_path" varchar(255) COLLATE "pg_catalog"."default",
  "component" varchar(255) COLLATE "pg_catalog"."default",
  "redirect" varchar(255) COLLATE "pg_catalog"."default",
  "is_cache" int2,
  "menu_type" char(1) COLLATE "pg_catalog"."default",
  "hidden" int2,
  "status" int2,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "is_blank" int2,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父级菜单';
COMMENT ON COLUMN "public"."sys_menu"."always_show" IS '是否收缩子菜单（当所有子菜单只有一个时，1、收缩，0不收缩）';
COMMENT ON COLUMN "public"."sys_menu"."props" IS '路由参数,JSON 字符串';
COMMENT ON COLUMN "public"."sys_menu"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."route_name" IS '路由名';
COMMENT ON COLUMN "public"."sys_menu"."route_path" IS '路由路径';
COMMENT ON COLUMN "public"."sys_menu"."component" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."redirect" IS '外链地址';
COMMENT ON COLUMN "public"."sys_menu"."is_cache" IS '是否缓存（1缓存 0不缓存）';
COMMENT ON COLUMN "public"."sys_menu"."menu_type" IS '菜单类型（M目录 C菜单 L外部连接）';
COMMENT ON COLUMN "public"."sys_menu"."hidden" IS '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '菜单状态（1正常 0停用）';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."is_blank" IS '是否新开窗口 1 是 0 否';
COMMENT ON COLUMN "public"."sys_menu"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_menu"."is_deleted" IS '是否已删除';
COMMENT ON TABLE "public"."sys_menu" IS '菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1963544670945005572, '我提交的', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{},"params":{}}', 5, 'FlowSubmitted', '/lf/process/userRequestList', 'lf/process/me', NULL, 1, 'C', 0, 1, 'ion:push', 1, 1, '2025-09-04 18:08:25.108724', 1, '2025-09-15 16:21:06.469596', 0);
INSERT INTO "public"."sys_menu" VALUES (6, '角色管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}, "routeCountConfig":{"name":"role", "params":{}}}', 1, 'role', 'role', 'system/role/index', NULL, 1, 'C', 0, 1, 'carbon:user-role', 0, NULL, NULL, 1, '2022-08-24 16:06:27', 0);
INSERT INTO "public"."sys_menu" VALUES (1475197863846027266, '客户端管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 7, 'client', 'client', 'system/client/index', NULL, 1, 'C', 0, 1, 'gridicons:share-computer', 0, 1, '2022-06-17 10:39:06', 1, '2022-09-21 16:18:12', 0);
INSERT INTO "public"."sys_menu" VALUES (1572500323467444226, '字典信息', 4, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 5, 'dict', 'dict/:dictCode', 'system/dict/index', NULL, 0, 'C', 1, 1, 'arcticons:colordict', 0, 1, '2022-09-21 16:17:47', 1, '2022-10-10 17:51:59', 0);
INSERT INTO "public"."sys_menu" VALUES (1537625854055940097, '参数管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 6, 'config', 'config', 'system/config/index', NULL, 1, 'C', 0, 1, 'icon-park-solid:config', 0, 1, '2022-06-17 10:39:06', 1, '2022-09-21 16:18:02', 0);
INSERT INTO "public"."sys_menu" VALUES (1575299088586797058, '租户管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 8, 'tenant', 'tenant', 'system/tenant/index', NULL, 1, 'C', 0, 1, 'fa-solid:house-user', 0, 1, '2022-09-29 09:39:05', 1, '2022-09-29 09:39:05', 0);
INSERT INTO "public"."sys_menu" VALUES (4, '系统管理', 0, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 99, 'system', '/system', 'Layout', '/system/user', 1, 'M', 0, 1, 'grommet-icons:system', 0, NULL, NULL, 1, '2023-06-28 13:49:36.402', 0);
INSERT INTO "public"."sys_menu" VALUES (1563061288516792322, '日志管理', 1627485035375833090, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 10, 'adminLog', 'admin-log', 'system/log/index', NULL, 1, 'C', 0, 1, 'bx:log-in', 0, 1, '2022-08-26 15:10:26', 1, '2022-09-29 09:39:14', 0);
INSERT INTO "public"."sys_menu" VALUES (1627485035375833090, '系统监控', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 99, 'monitoring', '/monitoring', 'Layout', '/monitoring/scheduling-task', 1, 'M', 0, 1, 'eos-icons:monitoring', 0, 1, '2023-02-20 09:47:24', 1, '2023-06-14 16:04:56.904', 0);
INSERT INTO "public"."sys_menu" VALUES (1631227390958325762, '任务调度日志', 1627485035375833090, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 1, 'SchedulingTaskLog', 'scheduling-task-log', 'scheduling/log', NULL, 1, 'C', 0, 1, 'icon-park-solid:log', 0, 1, '2023-03-02 17:38:11.406762', 1, '2023-03-02 17:38:29.894264', 0);
INSERT INTO "public"."sys_menu" VALUES (1529380639935463426, '百度AI', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":1,"transition":{}}', 1001, 'BaiduAI', 'baidu-ai', 'https://chat.baidu.com/', '', 1, 'C', 0, 1, 'ri:baidu-fill', 0, 1, '2022-06-25 12:08:43', 1, '2025-09-17 15:29:02.799588', 0);
INSERT INTO "public"."sys_menu" VALUES (1547818807554617346, '二级菜单2', 1547787400883089410, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 0, 'ceshi2', 'ceshi2-2', 'nested/menu2/index', NULL, 1, 'C', 0, 1, 'bx:menu-alt-left', 0, 1, '2022-07-15 13:42:15', 1, '2022-08-26 11:44:51', 0);
INSERT INTO "public"."sys_menu" VALUES (1547835699233173505, '二级菜单1', 1547787400883089410, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 0, 'ceshi1', 'ceshi2-1', 'Layout', NULL, 1, 'M', 0, 1, 'bx:menu-alt-left', 0, 1, '2022-07-15 14:49:23', 1, '2022-08-26 14:04:50', 0);
INSERT INTO "public"."sys_menu" VALUES (7, '用户管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{},"routeCountConfig":{"name":"user","params":{}}}', 0, 'user', 'user', 'system/user/index', NULL, 1, 'C', 0, 1, 'bxs:user', 0, NULL, NULL, 1, '2026-01-27 18:30:39.966857', 0);
INSERT INTO "public"."sys_menu" VALUES (1547787400883089410, '一级菜单', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 97, 'ceshi', '/ceshi', 'Layout', NULL, 1, 'M', 0, 1, 'bx:menu-alt-left', 0, 1, '2022-07-15 11:37:28', 1, '2022-08-26 14:26:03', 0);
INSERT INTO "public"."sys_menu" VALUES (5, '菜单管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'menu', 'menu', 'system/menu/index', NULL, 1, 'C', 0, 1, 'bi:menu-button-fill', 0, NULL, NULL, 1, '2022-08-24 16:08:14', 0);
INSERT INTO "public"."sys_menu" VALUES (1795660210988138497, '部门管理', 4, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'Dept', 'dept', 'system/dept/index', NULL, 1, 'C', 0, 1, 'eos-icons:organization', 0, 1, '2024-05-29 11:35:30.712', 1, '2024-05-29 11:35:30.712', 0);
INSERT INTO "public"."sys_menu" VALUES (1962731950251192321, '流程发布列表', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowDesignRL', '/lf/rl/:id', 'lf/release/index', NULL, 0, 'C', 1, 1, NULL, 1, 1, '2025-09-02 12:18:57.395281', 1, '2025-09-04 18:04:03.318503', 0);
INSERT INTO "public"."sys_menu" VALUES (1963542266031755265, '我收到的', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 4, 'FlowReceived', '/lf/received', 'Layout', NULL, 1, 'M', 0, 1, 'material-symbols:call-received', 1, 1, '2025-09-04 17:58:51.730793', 1, '2025-09-04 18:04:16.398395', 0);
INSERT INTO "public"."sys_menu" VALUES (1963544670945005570, '已办', 1963542266031755265, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowDone', '/lf/received/done', 'lf/received/done', NULL, 1, 'C', 0, 1, 'ant-design:file-done-outlined', 1, 1, '2025-09-04 18:08:25.108724', 1, '2025-09-04 18:09:00.294234', 0);
INSERT INTO "public"."sys_menu" VALUES (1963544670945005569, '待办', 1963542266031755265, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 1, 'FlowTodo', '/lf/received/todo', 'lf/received/todo', NULL, 1, 'C', 0, 1, 'wpf:todo-list', 1, 1, '2025-09-04 18:08:25.108724', 1, '2025-09-04 18:09:00.294234', 0);
INSERT INTO "public"."sys_menu" VALUES (1963544670945005571, '抄送', 1963542266031755265, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 3, 'FlowCC', '/lf/received/cc', 'lf/received/cc', NULL, 1, 'C', 0, 1, 'lucide:rotate-ccw-square', 1, 1, '2025-09-04 18:08:25.108724', 1, '2025-09-04 18:09:00.294234', 0);
INSERT INTO "public"."sys_menu" VALUES (1961001205065428993, '流程设计', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 1, 'FlowDesign', '/lf/design', 'lf/design/index', NULL, 1, 'C', 0, 1, 'iconoir:design-nib', 1, 1, '2025-08-28 17:41:35.587189', 1, '2025-09-04 11:51:31.391115', 0);
INSERT INTO "public"."sys_menu" VALUES (1963450958801895426, '发起申请', 1963450958801895425, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 1, 'FlowProcessInitiate', '/lf/process/initiate', 'lf/process/initiate', NULL, 1, 'C', 0, 1, 'lucide:send', 1, 1, '2025-09-04 11:56:02.39554', 1, '2025-09-04 18:04:10.983161', 0);
INSERT INTO "public"."sys_menu" VALUES (1963450958801895425, '流程申请', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 3, 'FlowProcess', '/lf/process', 'Layout', NULL, 1, 'M', 0, 1, 'carbon:ibm-event-processing', 1, 1, '2025-09-04 11:56:02.39554', 1, '2025-09-04 18:04:10.983161', 0);
INSERT INTO "public"."sys_menu" VALUES (1964010182879223809, '表单设计', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowFormDesign', '/lf/form/design', 'lf/form/design/index', NULL, 1, 'C', 0, 1, 'fluent:form-sparkle-20-regular', 1, 1, '2025-09-06 00:58:11.800388', 1, '2025-09-06 00:58:25.561666', 0);
INSERT INTO "public"."sys_menu" VALUES (1962731950251192333, '表单发布列表', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowFormDesignRL', '/lf/frl/:id', 'lf/form/release/index', NULL, 0, 'C', 1, 1, NULL, 1, 1, '2025-09-02 12:18:57.395281', 1, '2025-09-04 18:04:03.318503', 0);
INSERT INTO "public"."sys_menu" VALUES (0, 'Layout', NULL, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 0, 'Layout', 'Layout', 'Layout', NULL, 1, 'M', 1, 0, NULL, 0, NULL, NULL, NULL, '2022-06-22 09:14:06', 0);
INSERT INTO "public"."sys_menu" VALUES (1961000320654487554, '流程管理', 0, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 100, 'flow-manage', '/flow-manage', 'Layout', NULL, 1, 'M', 0, 1, 'ri:flow-chart', 1, 1, '2025-08-28 17:38:04.730677', 1, '2025-08-28 17:40:36.577463', 0);
INSERT INTO "public"."sys_menu" VALUES (2101558593198845954, '后端接口', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":2,"transition":{}}', 1000, 'RequestAPI', 'requestapi', 'http://127.0.0.1:9102/doc.html', '', 1, 'C', 0, 1, 'ri:link', 1, 1, '2026-09-20 14:26:28.350421', 1, '2026-09-20 14:29:56.444721', 0);
INSERT INTO "public"."sys_menu" VALUES (1572502356924743682, '个人中心', 4, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 97, 'personal', 'personal', 'system/personal/index', NULL, 1, 'C', 1, 1, 'akar-icons:laptop-device', 0, 1, '2022-09-21 16:25:52', 1, '2022-09-21 16:25:52', 0);
INSERT INTO "public"."sys_menu" VALUES (1962440040961822722, '流程图设计', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowDesignD', '/lf/d/:source/:id', 'lf/design/components/flow-designer/index', NULL, 0, 'C', 1, 1, NULL, 1, 1, '2025-09-01 16:59:00.804062', 1, '2025-09-04 18:03:58.897567', 0);
INSERT INTO "public"."sys_menu" VALUES (1631227390958325769, '后端接口文档', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":2,"transition":{}}', 999, 'RequestApi', NULL, 'http://127.0.0.1:9102/doc.html', NULL, 1, 'C', 0, 1, 'carbon:api', 1, 1, '2023-03-02 17:38:11.406762', 1, '2025-09-17 15:48:18.828784', 0);
INSERT INTO "public"."sys_menu" VALUES (1968222484428328962, 'PureAdmin', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"transition":{},"menuType":2}', 998, 'pureadmin', NULL, 'https://pure-admin.cn', NULL, 1, 'C', 0, 1, 'ep:link', 1, 1, '2025-09-17 15:56:22.760388', 1, '2025-09-17 15:56:22.761899', 0);
INSERT INTO "public"."sys_menu" VALUES (1963450958801895427, '申请列表', 1963450958801895425, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{},"params":{},"extraIcon":""}', 2, 'FlowProcessList', '/lf/process/list', 'lf/process/list', NULL, 1, 'C', 0, 1, 'lucide:list-start', 1, 1, '2025-09-04 11:56:02.39554', 1, '2025-09-15 16:30:54.462305', 0);
INSERT INTO "public"."sys_menu" VALUES (1475111131305844738, '权限管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 3, 'permission', 'permission', 'system/permission/index', NULL, 1, 'C', 0, 1, 'icon-park-twotone:permissions', 0, NULL, NULL, 1, '2022-08-24 16:09:04', 0);
INSERT INTO "public"."sys_menu" VALUES (1537320455847165953, '字典管理', 4, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 4, 'dictType', 'dict-type', 'system/dict-type/index', NULL, 1, 'C', 0, 1, 'arcticons:colordict', 0, 1, '2022-06-16 14:25:33', 1, '2022-08-26 16:42:41', 0);
INSERT INTO "public"."sys_menu" VALUES (1537698325769674753, '在线用户', 1627485035375833090, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 9, 'onlineUser', 'online-user', 'system/online-user/index', NULL, 1, 'C', 0, 1, 'carbon:user-online', 0, 1, '2022-06-17 15:27:05', 1, '2022-09-29 09:39:11', 0);
INSERT INTO "public"."sys_menu" VALUES (1627485430827397122, '任务调度', 1627485035375833090, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 0, 'SchedulingTask', 'scheduling-task', 'scheduling/index', NULL, 1, 'C', 0, 1, 'material-symbols:schedule-outline', 0, 1, '2023-02-20 09:48:59', 1, '2023-02-20 09:53:16', 0);
INSERT INTO "public"."sys_menu" VALUES (1547835850341363713, '三级菜单', 1547835699233173505, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 0, 'ceshi3', 'ceshi3', 'nested/menu1/menu1-1/index', '', 0, 'C', 0, 1, 'bx:menu-alt-left', 0, 1, '2022-07-15 14:49:59', 1, '2022-08-26 13:54:16', 0);
INSERT INTO "public"."sys_menu" VALUES (1964010182879223810, '自定义表单组件', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowFormCustomComponents', '/lf/form/custom-components', 'lf/form/custom-components/index', NULL, 1, 'C', 0, 1, 'uiw:component', 1, 1, '2025-09-06 00:58:11.800388', 1, '2025-09-06 00:58:25.561666', 0);
INSERT INTO "public"."sys_menu" VALUES (1964010182879223811, '动态表单设计', 1961000320654487554, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":0,"transition":{}}', 2, 'FlowFormDesignD', '/lf/fd/:source/:id', 'lf/form/components/form-designer/index', NULL, 0, 'C', 1, 1, NULL, 1, 1, '2025-09-01 16:59:00.804062', 1, '2025-09-04 18:03:58.897567', 0);
INSERT INTO "public"."sys_menu" VALUES (1944928279526395906, '豆包', 0, 1, '{"hiddenTag":false,"fixedTag":false,"menuType":1,"transition":{"enterTransition":"tada","leaveTransition":"swing"},"frameLoading":true}', 1000, 'Doubao', 'doubao', 'https://www.doubao.com/chat', NULL, 1, 'C', 0, 1, 'hugeicons:ai-search', 1, 1, '2025-07-15 09:13:31.528387', 1, '2025-09-17 15:47:17.818072', 0);
INSERT INTO "public"."sys_menu" VALUES (1969941885586255873, '在线文档', 0, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"transition":{},"menuType":0}', 96, 'OnlineDocument', '/onlineDoc', 'Layout', NULL, 1, 'C', 0, 1, 'ep:document', 1, 1, '2025-09-22 09:48:39.944954', 1, '2025-09-23 10:45:05.86194', 0);
INSERT INTO "public"."sys_menu" VALUES (1969942162087358465, '在线文档', 1969941885586255873, 0, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"transition":{},"menuType":0}', 0, 'OnlyOffice', '/online-doc', 'online-doc/index.vue', NULL, 1, 'C', 0, 1, 'ep:document-copy', 1, 1, '2025-09-22 09:49:45.854123', 1, '2025-09-23 10:49:04.148867', 0);
INSERT INTO "public"."sys_menu" VALUES (1631227390958325768, 'mangocrisp', 0, 1, '{"frameLoading":true,"hiddenTag":false,"fixedTag":false,"menuType":2,"transition":{}}', 999, 'mangocrisp', NULL, 'https://mangocrisp.github.io', NULL, 1, 'C', 0, 1, 'entypo-social:github-with-circle', 1, 1, '2023-03-02 17:38:11.406762', 1, '2025-09-17 15:48:18.828784', 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "title" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "message" text COLLATE "pg_catalog"."default" NOT NULL,
  "level" varchar(100) COLLATE "pg_catalog"."default",
  "positive" int2 NOT NULL,
  "data" jsonb,
  "topic" varchar(100) COLLATE "pg_catalog"."default",
  "sub_type" varchar(100) COLLATE "pg_catalog"."default",
  "from_user" int8,
  "from_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "from_user_avatar" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_notice"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_notice"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_notice"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_notice"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_notice"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_notice"."title" IS '标题';
COMMENT ON COLUMN "public"."sys_notice"."message" IS '通知消息';
COMMENT ON COLUMN "public"."sys_notice"."level" IS '级别(字典 notice_level)';
COMMENT ON COLUMN "public"."sys_notice"."positive" IS '是否是确定指定的通知(1是 0 否)';
COMMENT ON COLUMN "public"."sys_notice"."data" IS '通知数据';
COMMENT ON COLUMN "public"."sys_notice"."topic" IS '通知类型（订阅主题）';
COMMENT ON COLUMN "public"."sys_notice"."sub_type" IS '子类型';
COMMENT ON COLUMN "public"."sys_notice"."from_user" IS '发送人';
COMMENT ON COLUMN "public"."sys_notice"."from_user_name" IS '发送人名称';
COMMENT ON COLUMN "public"."sys_notice"."from_user_avatar" IS '发送人头像';
COMMENT ON TABLE "public"."sys_notice" IS '消息通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO "public"."sys_notice" VALUES (1960231481448706050, 1945059926271860737, '2025-08-26 14:42:59.182269', 1945059926271860737, '2025-08-26 14:42:59.182269', 0, '通知', '通知18', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231496460120066, 1945059926271860737, '2025-08-26 14:43:02.755458', 1945059926271860737, '2025-08-26 14:43:02.756965', 0, '通知', '通知19', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960155764673327106, 1945059926271860737, '2025-08-26 09:42:06.897135', 1945059926271860737, '2025-08-26 09:42:06.897135', 0, '简单消息', '如果是发给指定的人', '1', 0, '{"extra": "消息", "status": "success"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960156433891307522, 1945059926271860737, '2025-08-26 09:44:46.444202', 1945059926271860737, '2025-08-26 09:44:46.444202', 0, '消息啊', '消息2', '1', 0, '{"extra": "消息", "status": "success"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960156852499623937, 1945059926271860737, '2025-08-26 09:46:26.249796', 1945059926271860737, '2025-08-26 09:46:26.249796', 0, '消息啊', '消息3', '1', 0, '{"extra": "消息", "status": "success"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960156901019332610, 1945059926271860737, '2025-08-26 09:46:37.818572', 1945059926271860737, '2025-08-26 09:46:37.818572', 0, '消息啊', '消息4', '1', 0, '{"extra": "消息", "status": "success"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231518476021762, 1945059926271860737, '2025-08-26 14:43:08.011074', 1945059926271860737, '2025-08-26 14:43:08.011074', 0, '通知', '通知20', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159873002483713, 1945059926271860737, '2025-08-26 09:58:26.395391', 1945059926271860737, '2025-08-26 09:58:26.395391', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159614281035778, 1945059926271860737, '2025-08-26 09:57:24.719685', 1945059926271860737, '2025-08-26 09:57:24.719685', 0, '通知', '通知4', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159686263681026, 1945059926271860737, '2025-08-26 09:57:41.875542', 1945059926271860737, '2025-08-26 09:57:41.875542', 0, '通知', '通知5', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1, 1, '2025-08-25 18:03:48', NULL, NULL, 0, '消息通知', '简单的消息通知', '1', 1, '{"extra": "简单消息", "status": "primary"}', 'SYS_NOTICE', NULL, 1, 'Amy', NULL);
INSERT INTO "public"."sys_notice" VALUES (1960158885201948673, 1945059926271860737, '2025-08-26 09:54:30.888896', 1945059926271860737, '2025-08-26 09:54:30.888896', 0, '通知', '通知2', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159400845488130, 1945059926271860737, '2025-08-26 09:56:33.824181', 1945059926271860737, '2025-08-26 09:56:33.825701', 0, '通知', '通知3', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231289991311361, 1945059926271860737, '2025-08-26 14:42:13.538897', 1945059926271860737, '2025-08-26 14:42:13.538897', 0, '通知', '通知7', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231311231266817, 1945059926271860737, '2025-08-26 14:42:18.605283', 1945059926271860737, '2025-08-26 14:42:18.605283', 0, '通知', '通知8', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231331154210817, 1945059926271860737, '2025-08-26 14:42:23.353111', 1945059926271860737, '2025-08-26 14:42:23.353111', 0, '通知', '通知9', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231351681134594, 1945059926271860737, '2025-08-26 14:42:28.248826', 1945059926271860737, '2025-08-26 14:42:28.248826', 0, '通知', '通知10', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231369402068994, 1945059926271860737, '2025-08-26 14:42:32.469361', 1945059926271860737, '2025-08-26 14:42:32.469361', 0, '通知', '通知11', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231383738200065, 1945059926271860737, '2025-08-26 14:42:35.880347', 1945059926271860737, '2025-08-26 14:42:35.880347', 0, '通知', '通知12', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231398535704578, 1945059926271860737, '2025-08-26 14:42:39.421711', 1945059926271860737, '2025-08-26 14:42:39.421711', 0, '通知', '通知13', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231412779560961, 1945059926271860737, '2025-08-26 14:42:42.805826', 1945059926271860737, '2025-08-26 14:42:42.805826', 0, '通知', '通知14', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231430857011202, 1945059926271860737, '2025-08-26 14:42:47.114455', 1945059926271860737, '2025-08-26 14:42:47.114455', 0, '通知', '通知15', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231447034441729, 1945059926271860737, '2025-08-26 14:42:50.975516', 1945059926271860737, '2025-08-26 14:42:50.97704', 0, '通知', '通知16', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960236790028283905, 1945059926271860737, '2025-08-26 15:04:04.847517', 1945059926271860737, '2025-08-26 15:04:04.847517', 0, '通知', '通知21', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960237341302435842, 1945059926271860737, '2025-08-26 15:06:16.282814', 1945059926271860737, '2025-08-26 15:06:16.284327', 0, '通知', '通知22', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960239443273605121, 1945059926271860737, '2025-08-26 15:14:37.423255', 1945059926271860737, '2025-08-26 15:14:37.423255', 0, '通知', '通知23', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240011853455362, 1945059926271860737, '2025-08-26 15:16:52.981861', 1945059926271860737, '2025-08-26 15:16:52.981861', 0, '通知', '通知24', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240127318450177, 1945059926271860737, '2025-08-26 15:17:20.523879', 1945059926271860737, '2025-08-26 15:17:20.524881', 0, '通知', '通知25', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240153931309058, 1945059926271860737, '2025-08-26 15:17:26.870125', 1945059926271860737, '2025-08-26 15:17:26.870125', 0, '通知', '通知26', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240211116449793, 1945059926271860737, '2025-08-26 15:17:40.500352', 1945059926271860737, '2025-08-26 15:17:40.500352', 0, '通知', '通知27', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240238505254914, 1945059926271860737, '2025-08-26 15:17:47.02666', 1945059926271860737, '2025-08-26 15:17:47.02666', 0, '通知', '通知28', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960158444405764097, 1945059926271860737, '2025-08-26 09:52:45.792064', 1945059926271860737, '2025-08-26 09:52:45.792064', 0, '待办', '待办2', '1', 1, '{"extra": "加快处理", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960158286964174850, 1945059926271860737, '2025-08-26 09:52:08.254074', 1945059926271860737, '2025-08-26 09:52:08.254074', 0, '待办', '待办1', '1', 1, '{"extra": "加快处理", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159235019485186, 1945059926271860737, '2025-08-26 09:55:54.286552', 1945059926271860737, '2025-08-26 09:55:54.286552', 0, '消息', '消息6', '1', 1, '{"extra": "你的朋友", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960240270616846338, 1945059926271860737, '2025-08-26 15:17:54.688669', 1945059926271860737, '2025-08-26 15:17:54.688669', 0, '通知', '通知29', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960241197428006913, 1945059926271860737, '2025-08-26 15:21:35.655874', 1945059926271860737, '2025-08-26 15:21:35.655874', 0, '通知', '通知30', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960241245045940225, 1945059926271860737, '2025-08-26 15:21:47.00945', 1945059926271860737, '2025-08-26 15:21:47.01045', 0, '通知', '通知31', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960243192352235521, 1945059926271860737, '2025-08-26 15:29:31.27971', 1945059926271860737, '2025-08-26 15:29:31.27971', 0, '通知', '通知32', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960243596582477826, 1945059926271860737, '2025-08-26 15:31:07.661129', 1945059926271860737, '2025-08-26 15:31:07.661129', 0, '通知', '通知33', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960243745857757185, 1945059926271860737, '2025-08-26 15:31:43.249057', 1945059926271860737, '2025-08-26 15:31:43.249057', 0, '通知', '通知34', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960243792578109442, 1945059926271860737, '2025-08-26 15:31:54.384645', 1945059926271860737, '2025-08-26 15:31:54.384645', 0, '通知', '通知35', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960244721427701761, 1945059926271860737, '2025-08-26 15:35:35.845782', 1945059926271860737, '2025-08-26 15:35:35.845782', 0, '通知', '通知36', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960244808342069250, 1945059926271860737, '2025-08-26 15:35:56.553912', 1945059926271860737, '2025-08-26 15:35:56.553912', 0, '通知', '通知37', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960244894014922753, 1945059926271860737, '2025-08-26 15:36:16.984018', 1945059926271860737, '2025-08-26 15:36:16.984018', 0, '通知', '通知38', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960245059492798466, 1945059926271860737, '2025-08-26 15:36:56.439966', 1945059926271860737, '2025-08-26 15:36:56.439966', 0, '通知', '通知39', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960245221158051841, 1945059926271860737, '2025-08-26 15:37:34.987826', 1945059926271860737, '2025-08-26 15:37:34.987826', 0, '通知', '通知40', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960245553665695746, 1945059926271860737, '2025-08-26 15:38:54.264237', 1945059926271860737, '2025-08-26 15:38:54.264237', 0, '通知', '通知41', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960245852543410177, 1945059926271860737, '2025-08-26 15:40:05.522775', 1945059926271860737, '2025-08-26 15:40:05.522775', 0, '通知', '通知42', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960245985095999490, 1945059926271860737, '2025-08-26 15:40:37.124283', 1945059926271860737, '2025-08-26 15:40:37.124283', 0, '通知', '通知43', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960246291875782657, 1945059926271860737, '2025-08-26 15:41:50.267203', 1945059926271860737, '2025-08-26 15:41:50.267203', 0, '通知', '通知44', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960247299297271809, 1945059926271860737, '2025-08-26 15:45:50.455613', 1945059926271860737, '2025-08-26 15:45:50.455613', 0, '通知', '通知45', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960247364053131265, 1945059926271860737, '2025-08-26 15:46:05.8978', 1945059926271860737, '2025-08-26 15:46:05.8978', 0, '通知', '通知46', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960247608039989250, 1945059926271860737, '2025-08-26 15:47:04.067792', 1945059926271860737, '2025-08-26 15:47:04.067792', 0, '通知', '通知47', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960247750356918274, 1945059926271860737, '2025-08-26 15:47:37.98635', 1945059926271860737, '2025-08-26 15:47:37.98635', 0, '通知', '通知48', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960249944787410945, 1945059926271860737, '2025-08-26 15:56:21.191178', 1945059926271860737, '2025-08-26 15:56:21.191178', 0, '通知', '通知49', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960250154607468545, 1945059926271860737, '2025-08-26 15:57:11.204084', 1945059926271860737, '2025-08-26 15:57:11.204084', 0, '通知', '通知 50', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960250346253606914, 1945059926271860737, '2025-08-26 15:57:56.901039', 1945059926271860737, '2025-08-26 15:57:56.901039', 0, '通知', '通知 51', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960250645693358081, 1945059926271860737, '2025-08-26 15:59:08.287758', 1945059926271860737, '2025-08-26 15:59:08.287758', 0, '通知', '通知 52', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960250751977021442, 1945059926271860737, '2025-08-26 15:59:33.634256', 1945059926271860737, '2025-08-26 15:59:33.634256', 0, '通知', '通知 53', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960250988036644865, 1945059926271860737, '2025-08-26 16:00:29.912961', 1945059926271860737, '2025-08-26 16:00:29.912961', 0, '通知', '通知 54', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960251421174030337, 1945059926271860737, '2025-08-26 16:02:13.18802', 1945059926271860737, '2025-08-26 16:02:13.18802', 0, '通知', '通知 55', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960251564753444865, 1945059926271860737, '2025-08-26 16:02:47.417926', 1945059926271860737, '2025-08-26 16:02:47.417926', 0, '通知', '通知 56', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960285147794882562, 1, '2025-08-26 18:16:14.236622', 1, '2025-08-26 18:16:14.236622', 0, '消息', '消息8', '1', 1, '{"extra": "你的朋友", "status": "info"}', 'SYS_MESSAGE', NULL, 1, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960285192837513218, 1, '2025-08-26 18:16:24.972765', 1, '2025-08-26 18:16:24.972765', 0, '消息', '消息9', '1', 1, '{"extra": "你的朋友", "status": "info"}', 'SYS_MESSAGE', NULL, 1, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960159482667970561, 1945059926271860737, '2025-08-26 09:56:53.33684', 1945059926271860737, '2025-08-26 09:56:53.33684', 0, '待办', '待办3', '1', 1, '{"extra": "加快处理", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960285053746003969, 1945059926271860737, '2025-08-26 18:15:51.821015', 1945059926271860737, '2025-08-26 18:15:51.823014', 0, '消息', '消息7', '1', 1, '{"extra": "你的朋友", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960524845255610369, 1945059926271860737, '2025-08-27 10:08:42.570315', 1945059926271860737, '2025-08-27 10:08:42.570315', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960251716956348417, 1945059926271860737, '2025-08-26 16:03:23.698357', 1945059926271860737, '2025-08-26 16:03:23.698357', 0, '通知通知通知通知通知通知通知通知通知通知通知通知通知通知', '通知 57通知 57通知 57通知 57通知 57通知 57通知 57通知 57', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960524962998112258, 1945059926271860737, '2025-08-27 10:09:10.634832', 1945059926271860737, '2025-08-27 10:09:10.634832', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960552633870118913, 1945059926271860737, '2025-08-27 11:59:07.880244', 1945059926271860737, '2025-08-27 11:59:07.880244', 0, '通知', '通知58', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960231465065754625, 1945059926271860737, '2025-08-26 14:42:55.268135', 1945059926271860737, '2025-08-26 14:42:55.268135', 0, '通知', '通知17', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960552680502390786, 1945059926271860737, '2025-08-27 11:59:19.007001', 1945059926271860737, '2025-08-27 11:59:19.008527', 0, '通知', '通知59', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960552716476936193, 1945059926271860737, '2025-08-27 11:59:27.586425', 1945059926271860737, '2025-08-27 11:59:27.586939', 0, '通知', '通知60', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960879554160050177, 1945059926271860737, '2025-08-28 09:38:11.752674', 1945059926271860737, '2025-08-28 09:38:11.752674', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960879599261401090, 1945059926271860737, '2025-08-28 09:38:22.502428', 1945059926271860737, '2025-08-28 09:38:22.502428', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960879622615285762, 1945059926271860737, '2025-08-28 09:38:28.084487', 1945059926271860737, '2025-08-28 09:38:28.085005', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1960885095737413634, 1945059926271860737, '2025-08-28 10:00:12.965705', 1945059926271860737, '2025-08-28 10:00:12.967219', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993870796783120386, 1945059926271860737, '2025-11-27 10:33:36.94391', 1945059926271860737, '2025-11-27 10:33:36.94391', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993870995312111617, 1945059926271860737, '2025-11-27 10:34:24.281549', 1945059926271860737, '2025-11-27 10:34:24.282057', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871033677410306, 1945059926271860737, '2025-11-27 10:34:33.428517', 1945059926271860737, '2025-11-27 10:34:33.430034', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871146890063874, 1945059926271860737, '2025-11-27 10:35:00.420907', 1945059926271860737, '2025-11-27 10:35:00.422415', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871218528776193, 1945059926271860737, '2025-11-27 10:35:17.500434', 1945059926271860737, '2025-11-27 10:35:17.501946', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871252066430978, 1945059926271860737, '2025-11-27 10:35:25.496827', 1945059926271860737, '2025-11-27 10:35:25.497336', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871267216257025, 1945059926271860737, '2025-11-27 10:35:29.105784', 1945059926271860737, '2025-11-27 10:35:29.107294', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871337613455362, 1945059926271860737, '2025-11-27 10:35:45.891743', 1945059926271860737, '2025-11-27 10:35:45.892254', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871879609806849, 1945059926271860737, '2025-11-27 10:37:55.117289', 1945059926271860737, '2025-11-27 10:37:55.118798', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993871901248221185, 1945059926271860737, '2025-11-27 10:38:00.275868', 1945059926271860737, '2025-11-27 10:38:00.275868', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993873762168631297, 1945059926271860737, '2025-11-27 10:45:23.95269', 1945059926271860737, '2025-11-27 10:45:23.954209', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993875203176296450, 1945059926271860737, '2025-11-27 10:51:07.505317', 1945059926271860737, '2025-11-27 10:51:07.505317', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (1993875219483750402, 1945059926271860737, '2025-11-27 10:51:11.407347', 1945059926271860737, '2025-11-27 10:51:11.407347', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036738371955052546, 1945059926271860737, '2026-03-25 17:34:03.311997', 1945059926271860737, '2026-03-25 17:34:03.313661', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036739780503007233, 1945059926271860737, '2026-03-25 17:39:39.132619', 1945059926271860737, '2026-03-25 17:39:39.135144', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036739849679663106, 1945059926271860737, '2026-03-25 17:39:55.625006', 1945059926271860737, '2026-03-25 17:39:55.625006', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036739937357393921, 1945059926271860737, '2026-03-25 17:40:16.526648', 1945059926271860737, '2026-03-25 17:40:16.527653', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036739960828719106, 1945059926271860737, '2026-03-25 17:40:22.125078', 1945059926271860737, '2026-03-25 17:40:22.125078', 0, '通知', '通知6', '1', 0, '{"extra": "通知", "status": "warning"}', 'SYS_NOTICE', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036739981888319490, 1945059926271860737, '2026-03-25 17:40:27.155622', 1945059926271860737, '2026-03-25 17:40:27.156147', 0, '待办', '待办4', '1', 1, '{"extra": "这里发一个待办给你看看吧", "status": "danger"}', 'SYS_TODO', NULL, 1945059926271860737, NULL, NULL);
INSERT INTO "public"."sys_notice" VALUES (2036749452144398338, 1945059926271860737, '2026-03-25 18:18:05.034345', 1945059926271860737, '2026-03-25 18:18:05.035869', 0, '来自你的朋友的一条私发消息', '这里是内容', '1', 1, '{"extra": "我是普通用户啊", "status": "info"}', 'SYS_MESSAGE', NULL, 1945059926271860737, NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice_user";
CREATE TABLE "public"."sys_notice_user" (
  "notice_id" int8 NOT NULL,
  "related_id" int8 NOT NULL,
  "notice_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_notice_user"."notice_id" IS '通知 id';
COMMENT ON COLUMN "public"."sys_notice_user"."related_id" IS '用于关联的 id，可能是用户，角色，租户 等 id';
COMMENT ON COLUMN "public"."sys_notice_user"."notice_type" IS '通知类型(字典 notice_type)1是用户，其他的不管';
COMMENT ON COLUMN "public"."sys_notice_user"."status" IS '状态(0不可见 1 已读 2待办)';
COMMENT ON TABLE "public"."sys_notice_user" IS '通知用户关联表
删除消息通知，只能是把 status 指定为 0 ，因为还有其他类型的消息通知，直接删除是不行的';

-- ----------------------------
-- Records of sys_notice_user
-- ----------------------------
INSERT INTO "public"."sys_notice_user" VALUES (1, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960158286964174850, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960158444405764097, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960159235019485186, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960159482667970561, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960285053746003969, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960285147794882562, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960285192837513218, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960524845255610369, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960524962998112258, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960879599261401090, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960879622615285762, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1960885095737413634, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993870995312111617, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871033677410306, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871146890063874, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871252066430978, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871267216257025, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871879609806849, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (1993871901248221185, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036738371955052546, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036739780503007233, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036739849679663106, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036739937357393921, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036739981888319490, 1, '1', 2);
INSERT INTO "public"."sys_notice_user" VALUES (2036749452144398338, 1, '1', 2);

-- ----------------------------
-- Table structure for sys_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oauth2_client";
CREATE TABLE "public"."sys_oauth2_client" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "client_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "client_secret" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_ids" varchar(500) COLLATE "pg_catalog"."default",
  "scope" varchar(200) COLLATE "pg_catalog"."default",
  "authorized_grant_types" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "web_server_redirect_uri" varchar(1000) COLLATE "pg_catalog"."default",
  "authorities" varchar(2000) COLLATE "pg_catalog"."default",
  "access_token_validity" int4,
  "refresh_token_validity" int4,
  "additional_information" varchar(255) COLLATE "pg_catalog"."default",
  "auto_approve" varchar(10) COLLATE "pg_catalog"."default",
  "unique_key" int8,
  "client_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_oauth2_client"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_oauth2_client"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_oauth2_client"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_oauth2_client"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_oauth2_client"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_oauth2_client"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_oauth2_client"."client_id" IS '客户端 id';
COMMENT ON COLUMN "public"."sys_oauth2_client"."client_secret" IS '客户端密钥';
COMMENT ON COLUMN "public"."sys_oauth2_client"."resource_ids" IS '资源id列表';
COMMENT ON COLUMN "public"."sys_oauth2_client"."scope" IS '域逗号隔开';
COMMENT ON COLUMN "public"."sys_oauth2_client"."authorized_grant_types" IS '授权模式';
COMMENT ON COLUMN "public"."sys_oauth2_client"."web_server_redirect_uri" IS '回调地址';
COMMENT ON COLUMN "public"."sys_oauth2_client"."authorities" IS '权限列表';
COMMENT ON COLUMN "public"."sys_oauth2_client"."access_token_validity" IS '认证令牌时效';
COMMENT ON COLUMN "public"."sys_oauth2_client"."refresh_token_validity" IS '刷新令牌时效';
COMMENT ON COLUMN "public"."sys_oauth2_client"."additional_information" IS '扩展信息';
COMMENT ON COLUMN "public"."sys_oauth2_client"."auto_approve" IS '是否自动放行';
COMMENT ON COLUMN "public"."sys_oauth2_client"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."sys_oauth2_client"."client_name" IS '客户端名,可以描述客户端信息';
COMMENT ON TABLE "public"."sys_oauth2_client" IS '客户端';

-- ----------------------------
-- Records of sys_oauth2_client
-- ----------------------------
INSERT INTO "public"."sys_oauth2_client" VALUES (1947936658897342465, 1, '2025-07-23 16:27:45.061381', 1, '2025-07-23 17:36:18.3107', 0, 'test', 'db979badee0415662c82b59953f0dc07', NULL, 'all', 'code', 'https://www.baidu.com', NULL, 3600, 604800, NULL, 'true', 0, 'test');
INSERT INTO "public"."sys_oauth2_client" VALUES (1, 1, '2023-04-21 14:02:23.49', 1, '2025-08-25 18:02:13.569695', 0, 'taybct_pc', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'all', 'authorization_code,taybct,password,refresh_token,sms,wechat_qr_code,client_credentials,pki,taybct_refresh', 'https://www.baidu.com', NULL, 3600, 86400, NULL, 'true', 0, 'taybct_pc');

-- ----------------------------
-- Table structure for sys_params
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_params";
CREATE TABLE "public"."sys_params" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "type" varchar(128) COLLATE "pg_catalog"."default",
  "title" varchar(128) COLLATE "pg_catalog"."default",
  "params_key" varchar(128) COLLATE "pg_catalog"."default",
  "params_val" varchar(128) COLLATE "pg_catalog"."default",
  "status" int2,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "unique_key" int8
)
;
COMMENT ON COLUMN "public"."sys_params"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_params"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_params"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_params"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_params"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_params"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_params"."type" IS '类型（字典-系统参数类型）';
COMMENT ON COLUMN "public"."sys_params"."title" IS '标题：系统标题';
COMMENT ON COLUMN "public"."sys_params"."params_key" IS '键 例：title';
COMMENT ON COLUMN "public"."sys_params"."params_val" IS '值 例：冠宣';
COMMENT ON COLUMN "public"."sys_params"."status" IS '是否可用 1可用、0不可用';
COMMENT ON COLUMN "public"."sys_params"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_params"."unique_key" IS '逻辑唯一键';
COMMENT ON TABLE "public"."sys_params" IS '系统参数';

-- ----------------------------
-- Records of sys_params
-- ----------------------------
INSERT INTO "public"."sys_params" VALUES (1570681338925006849, 1, '2022-09-16 15:49:48', 1, '2022-12-07 15:32:30', 0, 'STRING', '重置密码', 'user_passwd', '123456', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600420241626038273, 1, '2022-12-07 17:21:35', 1, '2022-12-07 17:21:35', 0, 'STRING', '默认角色，游客', 'user_role', 'TOURIST', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600420305106829314, 1, '2022-12-07 17:21:50', 1, '2022-12-07 17:21:50', 0, 'NUMBER', '默认的游客角色 id', 'user_role_id', '5', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600420365202817025, 1, '2022-12-07 17:22:04', 1, '2022-12-07 17:22:04', 0, 'NUMBER', '用户默认状态', 'user_status', '1', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600420452104601602, 1, '2022-12-07 17:22:25', 1, '2022-12-07 17:22:25', 0, 'STRING', '默认租户 id', 'tenant_id', '000000', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600420622523367425, 1, '2022-12-07 17:23:05', 1, '2022-12-07 17:55:42', 0, 'STRING', '验证码的类型', 'captcha_type', 'GIF', 1, '可以查看枚举：io.github.mangocrisp.spring.taybct.common.constants.CaptchaType。
可选：CIRCLE，GIF，LINE，SHEAR，默认 GIF', 0);
INSERT INTO "public"."sys_params" VALUES (1573217163437035523, 1, '2022-09-23 15:46:15', 1, '2023-03-01 12:14:47.857079', 0, 'BOOLEAN', '是否允许重复登录同一个客户端', 'allow_multiple_token_one_client', 'true', 1, '这个配置，如果不配置，或者是禁用，默认系统是允许重复登录同一个客户端的', 0);
INSERT INTO "public"."sys_params" VALUES (1600420532530380801, 1, '2022-12-07 17:22:44', 1, '2023-03-09 10:12:58.866714', 0, 'BOOLEAN', '是否需要验证码登录', 'enable_captcha', 'false', 1, '', 0);
INSERT INTO "public"."sys_params" VALUES (1600419490103230466, 1, '2022-12-07 17:18:35', 1, '2022-12-07 17:16:55', 1, 'NUMBER', '菜单默认的 Layout', 'menu_layout', '0', 1, '', 1600420040123285505);
INSERT INTO "public"."sys_params" VALUES (1600419754042392578, 1, '2022-12-07 17:19:38', 1, '2022-12-07 17:16:55', 1, 'NUMBER', '默认的 ROOT 角色 id', 'role_root_id', '1', 1, '', 1600420040123285505);
INSERT INTO "public"."sys_params" VALUES (1537637376811536386, 1, '2022-06-17 11:24:53', 1, '2025-07-18 11:50:49.191031', 0, 'STRING', '系统标题', 'sys_title', 'TayBct平台', 1, '', 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_permission";
CREATE TABLE "public"."sys_permission" (
  "id" int8 NOT NULL,
  "group_id" int8,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_id" int8,
  "url_perm" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "btn_perm" varchar(64) COLLATE "pg_catalog"."default",
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_permission"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_permission"."group_id" IS '分组';
COMMENT ON COLUMN "public"."sys_permission"."name" IS '权限名';
COMMENT ON COLUMN "public"."sys_permission"."menu_id" IS '菜单id';
COMMENT ON COLUMN "public"."sys_permission"."url_perm" IS 'url 权限';
COMMENT ON COLUMN "public"."sys_permission"."btn_perm" IS '按钮权限';
COMMENT ON COLUMN "public"."sys_permission"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_permission"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_permission"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_permission"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_permission" IS '权限管理表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO "public"."sys_permission" VALUES (1572824840752533505, NULL, '权限批量删除', 1475111131305844738, 'DELETE:/system/{version}/permission/{ids}/batch', 'system:permission:del:batch', 1, '2022-09-22 13:47:18', 1, '2022-09-22 13:47:18');
INSERT INTO "public"."sys_permission" VALUES (1572155394710884355, 1580491239876640770, '菜单删除', 5, 'DELETE:/system/{version}/menu', 'system:menu:del', NULL, NULL, 1, '2022-10-13 17:31:28');
INSERT INTO "public"."sys_permission" VALUES (1572153139278434306, NULL, '角色编辑', 6, 'PUT:/system/{version}/role', 'system:role:edit', NULL, NULL, 1, '2023-01-13 17:03:10');
INSERT INTO "public"."sys_permission" VALUES (1572155394710884354, 1580491239876640770, '菜单新增', 5, 'POST:/system/{version}/menu', 'system:menu:add', NULL, NULL, 1, '2022-10-13 17:31:20');
INSERT INTO "public"."sys_permission" VALUES (1572155394710884356, 1580491239876640770, '菜单关联权限', 5, 'POST:/system/{version}/permission/batch', 'system:menuPerm:batch', NULL, NULL, 1, '2022-10-13 17:31:33');
INSERT INTO "public"."sys_permission" VALUES (1572155394710884357, 1580491239876640770, '菜单关联角色', 5, 'POST:/system/{version}/roleMenu/batch', 'system:menuRole:batch', NULL, NULL, 1, '2022-10-13 17:31:40');
INSERT INTO "public"."sys_permission" VALUES (1572141139009785858, NULL, '用户删除', 7, 'DELETE:/system/user', 'system:user:del', NULL, '2023-06-02 17:03:02.515', 1660854347478024193, '2023-06-02 17:03:02.52');
INSERT INTO "public"."sys_permission" VALUES (1572141139009785859, NULL, '用户新增', 7, 'POST:/system/{version}/user', 'system:user:add', NULL, '2023-06-02 17:03:02.515', 1660854347478024193, '2023-06-02 17:03:02.52');
INSERT INTO "public"."sys_permission" VALUES (1572141139009785860, NULL, '用户编辑', 7, 'PUT:/system/{version}/user', 'system:user:edit', NULL, '2023-06-02 17:03:02.515', 1660854347478024193, '2023-06-02 17:03:02.52');
INSERT INTO "public"."sys_permission" VALUES (1572141139009785861, NULL, '用户重置密码', 7, 'PUT:/system/{version}/user/passwd', 'system:user:passwd', NULL, '2023-06-02 17:03:02.515', 1660854347478024193, '2023-06-02 17:03:02.52');
INSERT INTO "public"."sys_permission" VALUES (1572153139278434305, NULL, '角色新增', 6, 'POST:/system/{version}/role', 'system:role:add', NULL, NULL, 1, '2023-01-13 17:03:10');
INSERT INTO "public"."sys_permission" VALUES (1572155394710884358, 1580491239876640770, '菜单编辑', 5, 'PUT:/system/{version}/menu', 'system:menu:edit', NULL, NULL, 1, '2022-10-13 17:30:58');
INSERT INTO "public"."sys_permission" VALUES (1572157879118778369, NULL, '权限新增', 1475111131305844738, 'POST:/system/{version}/permission', 'system:permission:add', NULL, NULL, 1660854347478024193, '2023-06-05 09:57:44.901');
INSERT INTO "public"."sys_permission" VALUES (1572157879118778370, NULL, '权限编辑', 1475111131305844738, 'PUT:/system/{version}/permission', 'system:permission:edit', NULL, NULL, 1660854347478024193, '2023-06-05 09:58:03.626');
INSERT INTO "public"."sys_permission" VALUES (1572157879118778371, 1633718264189677569, '权限删除', 1475111131305844738, 'DELETE:/system/{version}/permission', 'system:permission:del', NULL, NULL, 1664579188647510018, '2023-06-02 18:55:37.807');
INSERT INTO "public"."sys_permission" VALUES (1572158818093420546, NULL, '权限关联角色', 1475111131305844738, 'POST:/system/{version}/rolePerm/batch', 'system:permRole:batch', NULL, NULL, 1, '2022-09-22 13:47:18');
INSERT INTO "public"."sys_permission" VALUES (1572824375696494593, NULL, '用户批量删除', 7, 'DELETE:/system/{version}/user/{ids}/batch', 'system:user:del:batch', 1, '2023-06-02 17:03:02.515', 1660854347478024193, '2023-06-02 17:03:02.52');
INSERT INTO "public"."sys_permission" VALUES (1572824564767330306, NULL, '角色批量删除', 6, 'DELETE:/system/{version}/role/{ids}/batch', 'system:role:del:batch', 1, '2022-09-22 13:46:13', 1, '2023-01-13 17:03:10');
INSERT INTO "public"."sys_permission" VALUES (1572825466106482689, NULL, '字典类型删除', 1537320455847165953, 'DELETE:/system/{version}/dictType', 'system:dict-type:del', 1, '2022-09-22 13:49:47', 1, '2022-09-22 13:49:47');
INSERT INTO "public"."sys_permission" VALUES (1572825466106482690, NULL, '字典类型批量删除', 1537320455847165953, 'DELETE:/system/{version}/dictType/{ids}/batch', 'system:dict-type:del:batch', 1, '2022-09-22 13:49:47', 1, '2022-09-22 13:49:47');
INSERT INTO "public"."sys_permission" VALUES (1572825466114871297, NULL, '字典类型编辑', 1537320455847165953, 'PUT:/system/{version}/dictType', 'system:dict-type:edit', 1, '2022-09-22 13:49:47', 1, '2022-09-22 13:49:47');
INSERT INTO "public"."sys_permission" VALUES (1572825466114871298, NULL, '字典类型新增', 1537320455847165953, 'POST:/system/{version}/dictType', 'system:dict-type:add', 1, '2022-09-22 13:49:47', 1, '2022-09-22 13:49:47');
INSERT INTO "public"."sys_permission" VALUES (1572825926288740353, NULL, '字典信息新增', 1572500323467444226, 'POST:/system/{version}/dict', 'system:dict:add', 1, '2023-06-02 16:51:28.675', 1660854347478024193, '2023-06-02 16:51:28.68');
INSERT INTO "public"."sys_permission" VALUES (1572825926288740354, NULL, '字典信息删除', 1572500323467444226, 'DELETE:/system/{version}/dict', 'system:dict:del', 1, '2023-06-02 16:51:28.675', 1660854347478024193, '2023-06-02 16:51:28.68');
INSERT INTO "public"."sys_permission" VALUES (1572825926288740355, NULL, '字典信息编辑', 1572500323467444226, 'PUT:/system/{version}/dict', 'system:dict:edit', 1, '2023-06-02 16:51:28.675', 1660854347478024193, '2023-06-02 16:51:28.68');
INSERT INTO "public"."sys_permission" VALUES (1572825926288740356, NULL, '字典信息批量删除', 1572500323467444226, 'DELETE:/system/{version}/dict/{ids}/batch', 'system:dict:del:batch', 1, '2023-06-02 16:51:28.675', 1660854347478024193, '2023-06-02 16:51:28.68');
INSERT INTO "public"."sys_permission" VALUES (1572826445522604033, NULL, '参数编辑', 1537625854055940097, 'PUT:/system/{version}/params', 'system:params:edit', 1, '2022-09-22 13:53:41', 1, '2022-09-22 13:53:41');
INSERT INTO "public"."sys_permission" VALUES (1572826445522604034, NULL, '参数删除', 1537625854055940097, 'DELETE:/system/{version}/params', 'system:params:del', 1, '2022-09-22 13:53:41', 1, '2022-09-22 13:53:41');
INSERT INTO "public"."sys_permission" VALUES (1572826445522604035, NULL, '参数批量删除', 1537625854055940097, 'DELETE:/system/{version}/params/{ids}/batch', 'system:params:del:batch', 1, '2022-09-22 13:53:41', 1, '2022-09-22 13:53:41');
INSERT INTO "public"."sys_permission" VALUES (1572826445522604036, NULL, '参数新增', 1537625854055940097, 'POST:/system/{version}/params', 'system:params:add', 1, '2022-09-22 13:53:41', 1, '2022-09-22 13:53:41');
INSERT INTO "public"."sys_permission" VALUES (1572827171908947969, NULL, '客户端新增', 1475197863846027266, 'POST:/system/{version}/oauth2Client', 'system:client:add', 1, '2022-09-22 13:56:34', 1, '2022-09-22 13:56:34');
INSERT INTO "public"."sys_permission" VALUES (1572827171917336578, NULL, '客户端设置密钥', 1475197863846027266, 'PATCH:/system/{version}/oauth2Client', 'system:client:secret', 1, '2022-09-22 13:56:34', 1, '2022-09-22 13:56:34');
INSERT INTO "public"."sys_permission" VALUES (1572827171917336579, NULL, '客户端删除', 1475197863846027266, 'DELETE:/system/{version}/oauth2Client', 'system:client:del', 1, '2022-09-22 13:56:34', 1, '2022-09-22 13:56:34');
INSERT INTO "public"."sys_permission" VALUES (1572827171917336580, NULL, '客户端批量删除', 1475197863846027266, 'DELETE:/system/{version}/oauth2Client/{ids}/batch', 'system:client:del:batch', 1, '2022-09-22 13:56:34', 1, '2022-09-22 13:56:34');
INSERT INTO "public"."sys_permission" VALUES (1572827171917336581, NULL, '客户端编辑', 1475197863846027266, 'PUT:/system/{version}/oauth2Client', 'system:client:edit', 1, '2022-09-22 13:56:34', 1, '2022-09-22 13:56:34');
INSERT INTO "public"."sys_permission" VALUES (1572827421113520129, NULL, '用户强制下线', 1537698325769674753, 'PUT:/system/{version}/user/forceAll', 'system:user:force-all', 1, '2022-09-22 13:57:34', 1, '2022-09-22 13:57:34');
INSERT INTO "public"."sys_permission" VALUES (1572827619025948673, NULL, '清空日志', 1563061288516792322, 'DELETE:/admin/{version}-log/apiLog/all', 'admin-log:api-log:del:all', 1, '2022-09-22 13:58:21', 1, '2022-09-23 17:26:50');
INSERT INTO "public"."sys_permission" VALUES (1578999516344270849, NULL, '租户批量删除', 1575299088586797058, 'DELETE:/system/{version}/tenant/{ids}/batch', 'system:tenant:del:batch', 1, '2022-10-09 14:43:16', 1, '2022-10-13 17:28:26');
INSERT INTO "public"."sys_permission" VALUES (1578999516344270850, NULL, '租户编辑', 1575299088586797058, 'PUT:/system/{version}/tenant', 'system:tenant:edit', 1, '2022-10-09 14:43:16', 1, '2022-10-13 17:28:26');
INSERT INTO "public"."sys_permission" VALUES (1578999516344270851, NULL, '租户新增', 1575299088586797058, 'POST:/system/{version}/tenant', 'system:tenant:add', 1, '2022-10-09 14:43:16', 1, '2022-10-13 17:28:26');
INSERT INTO "public"."sys_permission" VALUES (1578999516344270852, NULL, '租户删除', 1575299088586797058, 'DELETE:/system/{version}/tenant', 'system:tenant:del', 1, '2022-10-09 14:43:16', 1, '2022-10-13 17:28:26');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881537, 1631121175154610177, '启动', 1627485430827397122, 'PUT:/scheduling/{version}/scheduling/start', 'scheduling:task:start', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881538, 1631121175154610177, '新增', 1627485430827397122, 'POST:/scheduling/{version}/scheduling', 'scheduling:task:add', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881539, 1631121175154610177, '重启', 1627485430827397122, 'PUT:/scheduling/{version}/scheduling/restart', 'scheduling:task:restart', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881540, 1631121175154610177, '编辑', 1627485430827397122, 'PATCH:/scheduling/{version}/scheduling', 'scheduling:task:edit', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881541, 1631121175154610177, '批量删除', 1627485430827397122, 'DELETE:/scheduling/{version}/scheduling/batch', 'scheduling:task:del:batch', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881542, 1631121175154610177, '删除', 1627485430827397122, 'DELETE:/scheduling/{version}/scheduling/{id}', 'scheduling:task:del', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1631122862690881543, 1631121175154610177, '停止', 1627485430827397122, 'PUT:/scheduling/{version}/scheduling/stop', 'scheduling:task:stop', 1, '2023-03-02 10:42:49.901605', 1, '2023-03-02 10:42:49.901605');
INSERT INTO "public"."sys_permission" VALUES (1572153139278434307, NULL, '角色删除', 6, 'DELETE:/system/{version}/role', 'system:role:del', NULL, NULL, 1, '2023-01-13 17:03:10');
INSERT INTO "public"."sys_permission" VALUES (1983377231607078913, NULL, '查看权限', 7, 'GET:/system/{version}/user/page', 'system:user:view', 1, '2025-10-29 11:35:56.052505', 1, '2025-10-29 11:35:56.052505');
INSERT INTO "public"."sys_permission" VALUES (1983455586268340225, NULL, '查看权限', 6, 'GET:/system/{version}/role/page', 'system:role:view', 1, '2025-10-29 16:47:17.252401', 1, '2025-10-29 16:47:17.252401');
INSERT INTO "public"."sys_permission" VALUES (1983455959573979137, NULL, '查看权限', 5, 'GET:/system/{version}/menu/page', 'system:menu:view', 1, '2025-10-29 16:48:46.251938', 1, '2025-10-29 16:48:46.251938');
INSERT INTO "public"."sys_permission" VALUES (1983456190478802945, NULL, '查看权限', 1475111131305844738, 'GET:/system/{version}/permission/page', 'system:permission:view', 1, '2025-10-29 16:49:41.304908', 1, '2025-10-29 16:49:41.304908');
INSERT INTO "public"."sys_permission" VALUES (1983456367839141890, NULL, '查看权限', 1537320455847165953, 'GET:/system/{version}/dictType/page', 'system:dict-type:view', 1, '2025-10-29 16:50:23.592954', 1, '2025-10-29 16:50:23.592954');
INSERT INTO "public"."sys_permission" VALUES (1983456528782974978, NULL, '查看权限', 1572500323467444226, 'GET:/system/{version}/dict/page', 'system:dict:view', 1, '2025-10-29 16:51:01.972585', 1, '2025-10-29 16:51:01.972585');
INSERT INTO "public"."sys_permission" VALUES (1983456654364631042, NULL, '查看权限', 1537625854055940097, 'GET:/system/{version}/params/page', 'system:params:view', 1, '2025-10-29 16:51:31.913435', 1, '2025-10-29 16:51:31.913435');
INSERT INTO "public"."sys_permission" VALUES (1983456775877812225, NULL, '查看权限', 1475197863846027266, 'GET:/system/{version}/oauth2Client/page', 'system:client:view', 1, '2025-10-29 16:52:00.873565', 1, '2025-10-29 16:52:00.873565');
INSERT INTO "public"."sys_permission" VALUES (1983456905938984961, NULL, '查看权限', 1575299088586797058, 'GET:/system/{version}/tenant/page', 'system:tenant:view', 1, '2025-10-29 16:52:31.888094', 1, '2025-10-29 16:52:31.888094');
INSERT INTO "public"."sys_permission" VALUES (1983457171165798401, NULL, '查看权限', 1627485430827397122, 'GET:/scheduling/{version}/scheduling/page', 'scheduling:task:view', 1, '2025-10-29 16:53:35.130466', 1, '2025-10-29 16:53:35.130466');
INSERT INTO "public"."sys_permission" VALUES (1983457516885499906, NULL, '查看权限', 1537698325769674753, 'GET:/system/{version}/user/online/page', 'system:user-online:view', 1, '2025-10-29 16:54:57.549062', 1, '2025-10-29 16:54:57.549062');
INSERT INTO "public"."sys_permission" VALUES (1983457782821150721, NULL, '查看权限', 1563061288516792322, 'GET:/admin/{version}-log/apiLog/page', 'admin-log:api-log:view', 1, '2025-10-29 16:56:00.946591', 1, '2025-10-29 16:56:00.946591');
INSERT INTO "public"."sys_permission" VALUES (1580490637109018626, NULL, '租户分配到用户', 7, 'POST:/system/{version}/tenant/user', 'system:tenant:user:allot', 1, '2022-10-13 17:28:26', 1, '2022-10-13 17:28:26');

-- ----------------------------
-- Table structure for sys_permission_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_permission_group";
CREATE TABLE "public"."sys_permission_group" (
  "id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_permission_group"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_permission_group"."name" IS '组名';
COMMENT ON COLUMN "public"."sys_permission_group"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_permission_group"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_permission_group"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_permission_group"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_permission_group" IS '权限分组';

-- ----------------------------
-- Records of sys_permission_group
-- ----------------------------
INSERT INTO "public"."sys_permission_group" VALUES (1580491239876640770, '菜单管理', 1, '2022-10-13 17:30:50', 1, '2022-10-13 17:30:50');
INSERT INTO "public"."sys_permission_group" VALUES (1581928598270799873, '用户管理', 1, '2022-10-17 16:42:23', 1, '2022-10-17 16:42:23');
INSERT INTO "public"."sys_permission_group" VALUES (1631121175154610177, '任务调度', 1, '2023-03-02 10:36:07.581031', 1, '2023-03-02 10:36:07.581031');
INSERT INTO "public"."sys_permission_group" VALUES (1633718264189677569, '测试测试', 1, '2023-03-09 14:36:01.857', 1, '2023-03-09 14:36:01.857');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4,
  "status" int2 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default",
  "unique_key" int8
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名';
COMMENT ON COLUMN "public"."sys_role"."code" IS '角色代码';
COMMENT ON COLUMN "public"."sys_role"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_role"."status" IS '状态(1 有效 0 无效  2 冻结)';
COMMENT ON COLUMN "public"."sys_role"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_role"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_role"."tenant_id" IS '租户id';
COMMENT ON COLUMN "public"."sys_role"."unique_key" IS '逻辑唯一键';
COMMENT ON TABLE "public"."sys_role" IS '角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, '超级管理员', 'ROOT', 0, 1, 1, '2021-12-26 22:02:26', 1, '2022-10-13 16:15:51', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2, '管理员', 'ADMIN', 0, 1, 1, '2022-12-15 14:01:22', 1, '2023-05-31 16:15:26.754', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (5, '游客', 'TOURIST', 5, 1, 1, '2022-12-15 14:01:22', 1, '2022-10-19 15:37:36', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (4, '普通用户', 'NORMAL', 4, 1, 1, '2022-12-15 14:01:22', 1, '2023-06-05 14:18:08', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (1963080442572177409, '流程角色1', 'FLOW_1', 6, 1, 1, '2025-09-03 11:23:44.450037', 1, '2025-09-03 11:23:59.502755', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (1983103536934162433, '管理员（示例）', 'admin', 0, 1, 1, '2025-10-28 17:28:22.147276', 1, '2025-10-29 10:11:55.681358', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (1983103578566823938, '普通用户（示例）', 'common', 0, 1, 1, '2025-10-28 17:28:32.080979', 1, '2025-10-29 10:12:03.275069', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016688995991932929, 'demo1', 'demo1', 0, 1, 1, '2026-01-29 09:44:59.573868', 1, '2026-01-29 09:44:59.573868', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016689079974481922, 'A1', 'A1', 0, 1, 1, '2026-01-29 09:45:19.60151', 1, '2026-01-29 09:45:19.60151', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016689188611149825, 'A2', 'A2', 0, 1, 1, '2026-01-29 09:45:45.500313', 1, '2026-01-29 09:45:45.501821', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016690579899514881, 'A3', 'A3', 0, 1, 1, '2026-01-29 09:51:17.205999', 1, '2026-01-29 09:51:17.207005', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016693871723421697, 'A5', 'A5', 0, 1, 1, '2026-01-29 10:04:22.03893', 1, '2026-01-29 10:04:22.039929', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016695705783623682, 'B1', 'B1', 0, 1, 1, '2026-01-29 10:11:39.313301', 1, '2026-01-29 10:11:39.314302', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016698505997443073, 'B4', 'B4', 0, 1, 1, '2026-01-29 10:22:46.94986', 1, '2026-01-29 10:22:46.950865', 0, '000000', 0);
INSERT INTO "public"."sys_role" VALUES (2016700040940728322, 'B5', 'B5', 0, 1, 1, '2026-01-29 10:28:52.896438', 1, '2026-01-29 10:28:52.897438', 0, '000000', 0);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_dept";
CREATE TABLE "public"."sys_role_dept" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "dept_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_dept"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role_dept"."role_id" IS '角色 id';
COMMENT ON COLUMN "public"."sys_role_dept"."dept_id" IS '部门 id';
COMMENT ON TABLE "public"."sys_role_dept" IS '角色部门关联表，可以知道角色有多少部门，也可以知道部门有多少角色';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
  "checked" int2
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单id';
COMMENT ON COLUMN "public"."sys_role_menu"."checked" IS '是否选中，因为有上下级关系，这里要确定是否是选中的，没选中的说明是上级（半选/全选）';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1961000320654487554, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963544670945005572, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1964010182879223809, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963450958801895425, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963450958801895427, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963544670945005569, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963450958801895426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963544670945005570, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1962440040961822722, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 0, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1961001205065428993, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1962731950251192321, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963544670945005571, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1964010182879223810, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1962731950251192333, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1964010182879223811, 1);
INSERT INTO "public"."sys_role_menu" VALUES (1963080442572177409, 1963542266031755265, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1572502356924743682, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1631227390958325768, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963542266031755265, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963544670945005570, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1944928279526395906, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1547835699233173505, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963544670945005571, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1547835850341363713, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963450958801895426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1969941885586255873, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1969942162087358465, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 0, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1547818807554617346, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963450958801895427, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1968222484428328962, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 4, 0);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1961000320654487554, 0);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963544670945005569, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1547787400883089410, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1529380639935463426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963544670945005572, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1963450958801895425, 1);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1964010182879223810, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1547787400883089410, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963450958801895425, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963544670945005572, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1475197863846027266, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963544670945005570, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1795660210988138497, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963542266031755265, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 7, 0);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1547818807554617346, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1572502356924743682, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1572500323467444226, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1547835699233173505, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963544670945005571, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1563061288516792322, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 6, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963544670945005569, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1631227390958325768, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 0, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1944928279526395906, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1547818807554617346, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1572502356924743682, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1547835699233173505, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1631227390958325768, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1547787400883089410, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1529380639935463426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1968222484428328962, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1547835850341363713, 1);
INSERT INTO "public"."sys_role_menu" VALUES (5, 4, 0);
INSERT INTO "public"."sys_role_menu" VALUES (2, 5, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1537698325769674753, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1968222484428328962, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1529380639935463426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 4, 0);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1961000320654487554, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1627485430827397122, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1964010182879223809, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1537625854055940097, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1962731950251192333, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1964010182879223810, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1964010182879223811, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1627485035375833090, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1944928279526395906, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963450958801895426, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1631227390958325762, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1475111131305844738, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 0, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1962731950251192321, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1961001205065428993, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1547835850341363713, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1537320455847165953, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1962440040961822722, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1963450958801895427, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1969942162087358465, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1969941885586255873, 1);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_permission";
CREATE TABLE "public"."sys_role_permission" (
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_permission"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_permission"."permission_id" IS '权限id';
COMMENT ON TABLE "public"."sys_role_permission" IS '角色权限关联表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572826445522604036);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572826445522604035);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572826445522604034);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572158818093420546);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572824564767330306);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983456367839141890);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572153139278434307);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983455586268340225);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983457516885499906);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572157879118778370);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983456654364631042);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572155394710884358);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881537);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572155394710884357);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983455959573979137);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983377231607078913);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572155394710884354);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572157879118778371);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572155394710884356);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572155394710884355);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572157879118778369);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572141139009785860);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881542);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881543);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881540);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572826445522604033);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572141139009785859);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881541);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881538);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572141139009785861);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1631122862690881539);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572141139009785858);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572824840752533505);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983456528782974978);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825926288740353);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825926288740354);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825926288740355);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825926288740356);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827619025948673);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983457171165798401);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572824375696494593);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825466106482690);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825466114871298);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825466114871297);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572825466106482689);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827421113520129);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827171917336578);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572153139278434305);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572153139278434306);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983457782821150721);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827171917336580);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827171917336581);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827171917336579);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1572827171908947969);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983456775877812225);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1983456190478802945);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_tenant";
CREATE TABLE "public"."sys_tenant" (
  "id" int8 NOT NULL,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_manager" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "unique_key" numeric(20,0),
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "sort" int4
)
;
COMMENT ON COLUMN "public"."sys_tenant"."id" IS '主键 id';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_id" IS '租户 id';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_name" IS '租户名';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_manager" IS '租户管理员';
COMMENT ON COLUMN "public"."sys_tenant"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_tenant"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_tenant"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_tenant"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_tenant"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_tenant"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."sys_tenant"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_tenant"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_tenant"."status" IS '状态（1 启动 0 禁用）';
COMMENT ON COLUMN "public"."sys_tenant"."sort" IS '排序';
COMMENT ON TABLE "public"."sys_tenant" IS '租户表';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO "public"."sys_tenant" VALUES (1, '000000', '系统默认租户', 'root', 1, '2022-08-17 03:09:45', 1, '2022-10-18 17:48:20', 0, 0, 'ant-design:cloud-server-outlined', NULL, 1, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "username" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "real_name" varchar(64) COLLATE "pg_catalog"."default",
  "nickname" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "gender" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(32) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "user_type" varchar(2) COLLATE "pg_catalog"."default",
  "login_ip" varchar(128) COLLATE "pg_catalog"."default",
  "login_date" timestamp(6),
  "status" int2 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "openid" varchar(50) COLLATE "pg_catalog"."default",
  "unique_key" numeric(20,0),
  "new_col" varchar(100) COLLATE "pg_catalog"."default",
  "passwd_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_user"."username" IS '登录用户名';
COMMENT ON COLUMN "public"."sys_user"."real_name" IS '真实姓名';
COMMENT ON COLUMN "public"."sys_user"."nickname" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '电话';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."user_type" IS '用户类型（00系统用户）';
COMMENT ON COLUMN "public"."sys_user"."login_ip" IS '最后登录IP';
COMMENT ON COLUMN "public"."sys_user"."login_date" IS '最后登录时间';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态(1 有效 0 无效  2 冻结)';
COMMENT ON COLUMN "public"."sys_user"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_user"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."sys_user"."openid" IS '微信小程序 openid';
COMMENT ON COLUMN "public"."sys_user"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."sys_user"."new_col" IS '新字段';
COMMENT ON COLUMN "public"."sys_user"."passwd_time" IS '密码更新时间';
COMMENT ON TABLE "public"."sys_user" IS '用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (1963080001398505474, 'leader2', '', '小组长', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13888880001', NULL, '00', ' ', NULL, 1, 1, '2025-09-03 11:21:59.261628', 1, '2025-09-17 14:17:34.874101', 0, NULL, 0, NULL, '2025-09-03 11:21:59.260117');
INSERT INTO "public"."sys_user" VALUES (1945059926271860737, 'user', '用户', '普通用户', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13636360636', 'user@taybct.com', '00', ' ', NULL, 1, 1, '2025-07-15 17:56:38.553154', 1, '2025-10-22 17:26:02.975257', 0, NULL, 0, NULL, '2025-07-16 11:38:36.340245');
INSERT INTO "public"."sys_user" VALUES (2, 'admin', '管*员', 'Admin', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13737370337', 'admin@taybct.com', '00', NULL, NULL, 1, 0, '2022-01-02 10:50:06', 1, '2025-07-16 11:36:24.517958', 0, NULL, 0, NULL, '2022-01-02 10:50:06');
INSERT INTO "public"."sys_user" VALUES (1, 'root', '艾米', 'Amy', '2', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13838380438', 'amy@taybct.com', '00', NULL, NULL, 1, 0, '2022-01-02 10:50:06', 1, '2025-09-06 00:07:01.252278', 0, NULL, 0, NULL, '2025-07-24 17:33:13.933135');
INSERT INTO "public"."sys_user" VALUES (1963085401439076353, 'boos', NULL, '总经理', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13888880003', NULL, '00', ' ', NULL, 1, 1, '2025-09-03 11:43:26.736085', 1, '2025-09-03 11:43:59.675314', 0, NULL, 0, NULL, '2025-09-03 11:43:26.736085');
INSERT INTO "public"."sys_user" VALUES (1963084850613714945, 'leader1', NULL, '部门领导', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13888880002', NULL, '00', ' ', NULL, 1, 1, '2025-09-03 11:41:15.407096', 1, '2025-09-03 11:43:35.200496', 0, NULL, 0, NULL, '2025-09-03 11:41:15.405578');
INSERT INTO "public"."sys_user" VALUES (2081642555833409537, '测试', NULL, '测试', '1', 'G1l7pDflJ8GyWTm5BzsMY/I0ZBHtY+J7mqfKNuCD4Ub9v5rPZUhCtW2zotJBjsKH39CXjvjC8ysGg/bukgtF35XEJczveNHI8+q2hpuOvDQ=', NULL, '13533155548', NULL, '00', ' ', NULL, 1, 1, '2026-07-27 15:27:15.03208', 1, '2026-07-27 15:42:10.018', 0, NULL, 2081642555833409537, NULL, '2026-07-27 15:27:15.030016');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_dept";
CREATE TABLE "public"."sys_user_dept" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "dept_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_dept"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user_dept"."user_id" IS '用户 id';
COMMENT ON COLUMN "public"."sys_user_dept"."dept_id" IS '部门 id';
COMMENT ON TABLE "public"."sys_user_dept" IS '用户部门关联表，可以知道用户有多少部门，也可以知道部门有多少用户';

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO "public"."sys_user_dept" VALUES (1945059926527713281, 1945059926271860737, 2);
INSERT INTO "public"."sys_user_dept" VALUES (1945294810911367169, 2, 1);
INSERT INTO "public"."sys_user_dept" VALUES (1963080001792770050, 1963080001398505474, 2);
INSERT INTO "public"."sys_user_dept" VALUES (1963085437195517953, 1963084850613714945, 3);
INSERT INTO "public"."sys_user_dept" VALUES (1963085539876274177, 1963085401439076353, 4);
INSERT INTO "public"."sys_user_dept" VALUES (1963080001792770051, 1963080001398505474, 3);
INSERT INTO "public"."sys_user_dept" VALUES (1963080001792770052, 1963080001398505474, 4);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_online";
CREATE TABLE "public"."sys_user_online" (
  "id" int8 NOT NULL,
  "jti" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ip" varchar(20) COLLATE "pg_catalog"."default",
  "client_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "login_time" timestamp(6) NOT NULL,
  "exp" int8 NOT NULL,
  "exp_time" timestamp(6),
  "user_id" int8,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default",
  "auth_method" varchar(100) COLLATE "pg_catalog"."default",
  "access_token_value" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_user_online"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user_online"."jti" IS 'jwt token id';
COMMENT ON COLUMN "public"."sys_user_online"."ip" IS 'ip 地址';
COMMENT ON COLUMN "public"."sys_user_online"."client_id" IS '客户端 id';
COMMENT ON COLUMN "public"."sys_user_online"."user_name" IS '用户名';
COMMENT ON COLUMN "public"."sys_user_online"."login_time" IS '登录时间';
COMMENT ON COLUMN "public"."sys_user_online"."exp" IS '超时时间';
COMMENT ON COLUMN "public"."sys_user_online"."exp_time" IS '在什么时候超时';
COMMENT ON COLUMN "public"."sys_user_online"."user_id" IS '用户 id';
COMMENT ON COLUMN "public"."sys_user_online"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_user_online"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user_online"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."sys_user_online"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_user_online"."tenant_id" IS '租户id';
COMMENT ON COLUMN "public"."sys_user_online"."auth_method" IS '认证方式';
COMMENT ON COLUMN "public"."sys_user_online"."access_token_value" IS '访问的 token 值';
COMMENT ON TABLE "public"."sys_user_online" IS '在线用户';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色id';
COMMENT ON TABLE "public"."sys_user_role" IS '用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" VALUES (1, 1);
INSERT INTO "public"."sys_user_role" VALUES (1963080001398505474, 1963080442572177409);
INSERT INTO "public"."sys_user_role" VALUES (1963084850613714945, 1963080442572177409);
INSERT INTO "public"."sys_user_role" VALUES (1963085401439076353, 1963080442572177409);
INSERT INTO "public"."sys_user_role" VALUES (1945059926271860737, 4);
INSERT INTO "public"."sys_user_role" VALUES (1945059926271860737, 1983103578566823938);
INSERT INTO "public"."sys_user_role" VALUES (2, 2);
INSERT INTO "public"."sys_user_role" VALUES (2, 1983103536934162433);

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_tenant";
CREATE TABLE "public"."sys_user_tenant" (
  "user_id" int8 NOT NULL,
  "tenant_id" varchar(34) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_tenant"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."sys_user_tenant"."tenant_id" IS '租户id';
COMMENT ON TABLE "public"."sys_user_tenant" IS '用户_租户关联';

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------
INSERT INTO "public"."sys_user_tenant" VALUES (1, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (2, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (1945059926271860737, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (1963080001398505474, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (1963084850613714945, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (1963085401439076353, '000000');
INSERT INTO "public"."sys_user_tenant" VALUES (2081642555833409537, '000000');

-- ----------------------------
-- Table structure for t_online_doc
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_online_doc";
CREATE TABLE "public"."t_online_doc" (
  "id" int8 NOT NULL,
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2,
  "unique_key" int8,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "share" int2,
  "unique_field" varchar(255) COLLATE "pg_catalog"."default",
  "properties" jsonb,
  "dept_id" int8,
  "dept_name" varchar(255) COLLATE "pg_catalog"."default",
  "data" jsonb,
  "create_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "update_user_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."t_online_doc"."id" IS '主键';
COMMENT ON COLUMN "public"."t_online_doc"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."t_online_doc"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_online_doc"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."t_online_doc"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."t_online_doc"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."t_online_doc"."unique_key" IS '逻辑唯一键';
COMMENT ON COLUMN "public"."t_online_doc"."name" IS '表单名称';
COMMENT ON COLUMN "public"."t_online_doc"."share" IS '表单是否共享';
COMMENT ON COLUMN "public"."t_online_doc"."unique_field" IS '唯一字段';
COMMENT ON COLUMN "public"."t_online_doc"."properties" IS '表单属性设置（字段等）';
COMMENT ON COLUMN "public"."t_online_doc"."dept_id" IS '所属部门id';
COMMENT ON COLUMN "public"."t_online_doc"."dept_name" IS '所属部门名称';
COMMENT ON COLUMN "public"."t_online_doc"."data" IS '数据';
COMMENT ON COLUMN "public"."t_online_doc"."create_user_name" IS '创建人姓名';
COMMENT ON COLUMN "public"."t_online_doc"."update_user_name" IS '修改人姓名';
COMMENT ON TABLE "public"."t_online_doc" IS '在线文档';

-- ----------------------------
-- Records of t_online_doc
-- ----------------------------
INSERT INTO "public"."t_online_doc" VALUES (1970036619021402113, 1, '2025-09-22 16:05:06.310317', 1, '2025-09-22 16:05:06.311836', 0, 0, 'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 0, NULL, NULL, NULL, NULL, '{"url": "/2025/09/22/28989f3e3d4743bbb36787293ac1d389.xlsx", "title": "test.xlsx", "fileType": "xlsx", "originalUrl": "/2025/09/22/28989f3e3d4743bbb36787293ac1d389.xlsx", "documentType": "cell"}', '艾米', '艾米');
INSERT INTO "public"."t_online_doc" VALUES (1969953734679613442, 1, '2025-09-22 10:35:45.157617', 1, '2025-10-23 11:02:42.994048', 0, 0, 'xxx', 0, NULL, NULL, NULL, NULL, '{"url": "/2025/10/23/45b9162d8def49b084a6ccb159b47d99.docx", "title": "docker 相关操作.docx", "fileType": "docx", "historyData": [{"key": "1969953734679613442_1758508545000", "url": "/2025/10/23/45b9162d8def49b084a6ccb159b47d99.docx", "error": null, "token": "", "version": "20251023110242", "fileType": "docx", "previous": {"key": "1969953734679613442_1758508545000", "url": "/2025/10/23/45b9162d8def49b084a6ccb159b47d99.docx", "fileType": "docx"}, "changesUrl": null}], "originalUrl": "/2025/09/22/68b86331dd154e22a0cf98562838abb0.docx", "documentType": "word", "refreshHistoryDTO": {"error": null, "history": [{"key": "1969953734679613442_1758508545000", "user": {"id": "1", "name": "艾米"}, "changes": null, "created": "2025-10-23 11:02:42", "version": "20251023110242", "serverVersion": null}], "currentVersion": "20251023110242"}}', '艾米', '艾米');

-- ----------------------------
-- Table structure for t_online_doc_permit
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_online_doc_permit";
CREATE TABLE "public"."t_online_doc_permit" (
  "id" int8 NOT NULL,
  "doc_id" int8 NOT NULL,
  "dept_id" int8 NOT NULL,
  "user_id" int8,
  "permissions" jsonb,
  "is_admin" int2
)
;
COMMENT ON COLUMN "public"."t_online_doc_permit"."id" IS '主键';
COMMENT ON COLUMN "public"."t_online_doc_permit"."doc_id" IS '表单id';
COMMENT ON COLUMN "public"."t_online_doc_permit"."dept_id" IS '部门id';
COMMENT ON COLUMN "public"."t_online_doc_permit"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."t_online_doc_permit"."permissions" IS '文档的操作权限';
COMMENT ON COLUMN "public"."t_online_doc_permit"."is_admin" IS '是否是管理员';
COMMENT ON TABLE "public"."t_online_doc_permit" IS '在线文档操作权限';

-- ----------------------------
-- Records of t_online_doc_permit
-- ----------------------------

-- ----------------------------
-- Table structure for t_vue_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_vue_template";
CREATE TABLE "public"."t_vue_template" (
  "id" int8 NOT NULL,
  "create_user" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_user" int8,
  "update_time" timestamp(6),
  "is_deleted" int2 NOT NULL,
  "string" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "number_int" int4,
  "number_long" int8,
  "date" date,
  "date_time" timestamp(6),
  "number_byte" int2,
  "bool_type" bool,
  "text_type" text COLLATE "pg_catalog"."default",
  "json_type" json,
  "float_type" float4,
  "double_type" float8
)
;
COMMENT ON COLUMN "public"."t_vue_template"."id" IS '主键';
COMMENT ON COLUMN "public"."t_vue_template"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."t_vue_template"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_vue_template"."update_user" IS '修改人';
COMMENT ON COLUMN "public"."t_vue_template"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."t_vue_template"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "public"."t_vue_template"."string" IS '字符串类型';
COMMENT ON COLUMN "public"."t_vue_template"."number_int" IS '整数类型';
COMMENT ON COLUMN "public"."t_vue_template"."number_long" IS '长整数类型';
COMMENT ON COLUMN "public"."t_vue_template"."date" IS '日期类型';
COMMENT ON COLUMN "public"."t_vue_template"."date_time" IS '日期时间类型';
COMMENT ON COLUMN "public"."t_vue_template"."number_byte" IS '字节类型';
COMMENT ON COLUMN "public"."t_vue_template"."bool_type" IS '布尔类型';
COMMENT ON COLUMN "public"."t_vue_template"."text_type" IS '长文本类型';
COMMENT ON COLUMN "public"."t_vue_template"."json_type" IS 'JSON 类型';
COMMENT ON COLUMN "public"."t_vue_template"."float_type" IS '单精度浮点类型';
COMMENT ON COLUMN "public"."t_vue_template"."double_type" IS '双精度浮点类型';
COMMENT ON TABLE "public"."t_vue_template" IS '前端通用模板';

-- ----------------------------
-- Records of t_vue_template
-- ----------------------------
INSERT INTO "public"."t_vue_template" VALUES (1819664597403734017, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (6, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (7, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (8, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (9, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (10, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (11, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (12, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (2, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (3, 1819664597403734017, '2024-12-03 16:44:20', 1819664597403734017, '2024-12-03 16:44:22', 0, '字符串', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', 'fff', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (4, 1819664597403734017, '2024-12-03 16:44:20', 1, '2024-12-06 11:44:56.876249', 0, '字符串fff', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', '繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁繁', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (5, 1819664597403734017, '2024-12-03 16:44:20', 1, '2024-12-06 11:45:42.608236', 0, '字符串fff', 12345678, 1819664597403734017, '2024-12-03', '2024-12-03 16:44:42', 1, 'f', '我这一生好吃懒做九死一生', '{"name":"张三"}', 1.2, 1.234567891);
INSERT INTO "public"."t_vue_template" VALUES (1864881528770252801, 1, '2024-12-06 11:56:18.947714', 1, '2024-12-06 11:56:18.947714', 0, 'fff', NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."t_vue_template" VALUES (1864965168116023298, 1, '2024-12-06 17:28:40.115064', 1, '2024-12-06 17:28:40.115064', 0, 'fsadfasdf', 11122, 23344, '2024-12-06', '2024-12-06 17:22:00', 1, 'f', '体体体体体体体体体体体体体体', '{"name":"李四"}', 3.1, 3.14159265);
INSERT INTO "public"."t_vue_template" VALUES (1864965218049212418, 1, '2024-12-06 17:28:52.027903', 1, '2025-08-18 09:29:33.815', 0, 'fsadfasdf', 11122, 23344, '2024-12-06', '2024-12-06 17:22:00', 1, 'f', '体体体体体体体体体体体体体体', '{"name":"李四"}', 3.1, 3.14159265);
INSERT INTO "public"."t_vue_template" VALUES (1956285340134690817, 1, '2025-08-15 17:22:25.773192', 1, '2025-08-18 09:29:33.815', 0, 'test', 11, 22, '2025-08-15', '2025-08-15 17:22:04', 33, 'f', '44', '{"name":"demo","age":31}', 55, 66);
INSERT INTO "public"."t_vue_template" VALUES (1957300498730598402, 1, '2025-08-18 12:36:18.446456', 1, '2025-08-18 12:36:24.52', 1, '1', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."undo_log";
CREATE TABLE "public"."undo_log" (
  "id" int8 NOT NULL,
  "branch_id" int8 NOT NULL,
  "xid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "context" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "rollback_info" bytea NOT NULL,
  "log_status" int4 NOT NULL,
  "log_created" timestamp(6) NOT NULL,
  "log_modified" timestamp(6) NOT NULL,
  "ext" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "enabled" int2 NOT NULL
)
;
COMMENT ON TABLE "public"."users" IS 'spring security 用户表';

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Indexes structure for table api_log
-- ----------------------------
CREATE INDEX "idx_api_log_module" ON "public"."api_log" USING btree (
  "method" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_api_log_title" ON "public"."api_log" USING btree (
  "title" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_api_log_title" IS '模块名';
CREATE INDEX "idx_api_log_username" ON "public"."api_log" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_create_time" ON "public"."api_log" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table api_log
-- ----------------------------
ALTER TABLE "public"."api_log" ADD CONSTRAINT "api_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table authorities
-- ----------------------------
CREATE UNIQUE INDEX "ix_auth_username" ON "public"."authorities" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "authority" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table lf_design
-- ----------------------------
CREATE INDEX "idx_design_name" ON "public"."lf_design" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_design
-- ----------------------------
ALTER TABLE "public"."lf_design" ADD CONSTRAINT "lf_design_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_design_permissions
-- ----------------------------
CREATE INDEX "idx_design_d_id" ON "public"."lf_design_permissions" USING btree (
  "design_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_design_permissions
-- ----------------------------
ALTER TABLE "public"."lf_design_permissions" ADD CONSTRAINT "lf_design_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_edges
-- ----------------------------
CREATE INDEX "idx_edges_process_id" ON "public"."lf_edges" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_edges_s_node_id" ON "public"."lf_edges" USING btree (
  "source_node_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_edges_t_node_id" ON "public"."lf_edges" USING btree (
  "target_node_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_edges
-- ----------------------------
ALTER TABLE "public"."lf_edges" ADD CONSTRAINT "lf_edges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_form
-- ----------------------------
CREATE INDEX "idx_lf_form_name" ON "public"."lf_form" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_form
-- ----------------------------
ALTER TABLE "public"."lf_form" ADD CONSTRAINT "lf_form_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_form_release
-- ----------------------------
CREATE INDEX "idx_form_release_f_i" ON "public"."lf_form_release" USING btree (
  "form_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_form_release_name" ON "public"."lf_form_release" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_form_release
-- ----------------------------
ALTER TABLE "public"."lf_form_release" ADD CONSTRAINT "lf_form_release_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_history
-- ----------------------------
CREATE INDEX "idx_history_dept_id" ON "public"."lf_history" USING btree (
  "dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_history_user_id" ON "public"."lf_history" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_node_id" ON "public"."lf_history" USING btree (
  "node_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_process_id" ON "public"."lf_history" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_history
-- ----------------------------
ALTER TABLE "public"."lf_history" ADD CONSTRAINT "lf_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_nodes
-- ----------------------------
CREATE INDEX "idx_nodes_process_id" ON "public"."lf_nodes" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_nodes
-- ----------------------------
ALTER TABLE "public"."lf_nodes" ADD CONSTRAINT "lf_nodes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_present_process
-- ----------------------------
CREATE INDEX "idx_present_n_id" ON "public"."lf_present_process" USING btree (
  "node_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_present_p_id" ON "public"."lf_present_process" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_present_process
-- ----------------------------
ALTER TABLE "public"."lf_present_process" ADD CONSTRAINT "lf_present_process_pkey" PRIMARY KEY ("process_id", "node_id");

-- ----------------------------
-- Indexes structure for table lf_process
-- ----------------------------
CREATE INDEX "idx_process_dept_id" ON "public"."lf_process" USING btree (
  "dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_process_dept_id" IS '部门 id';
CREATE INDEX "idx_process_design_id" ON "public"."lf_process" USING btree (
  "design_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_process_design_id" IS '流程设计图 id';
CREATE INDEX "idx_process_release_id" ON "public"."lf_process" USING btree (
  "release_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_process_release_id" IS '流程版本 id';
CREATE INDEX "idx_process_status" ON "public"."lf_process" USING btree (
  "status" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "idx_process_user_id" ON "public"."lf_process" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_process_user_id" IS '用户 id';

-- ----------------------------
-- Primary Key structure for table lf_process
-- ----------------------------
ALTER TABLE "public"."lf_process" ADD CONSTRAINT "lf_process_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_release
-- ----------------------------
CREATE INDEX "idx_release_design_id" ON "public"."lf_release" USING btree (
  "design_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_release_name" ON "public"."lf_release" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_release
-- ----------------------------
ALTER TABLE "public"."lf_release" ADD CONSTRAINT "lf_release_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_release_permissions
-- ----------------------------
CREATE INDEX "idx_release_p_re_id" ON "public"."lf_release_permissions" USING btree (
  "release_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_release_permissions
-- ----------------------------
ALTER TABLE "public"."lf_release_permissions" ADD CONSTRAINT "lf_release_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table lf_todo
-- ----------------------------
CREATE INDEX "idx_todo_d_id" ON "public"."lf_todo" USING btree (
  "design_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_todo_n_id" ON "public"."lf_todo" USING btree (
  "node_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_todo_p_id" ON "public"."lf_todo" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_todo_process_id" ON "public"."lf_todo" USING btree (
  "process_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_user_id_status" ON "public"."lf_todo" USING btree (
  "status" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table lf_todo
-- ----------------------------
ALTER TABLE "public"."lf_todo" ADD CONSTRAINT "lf_release_permissions_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_authorization
-- ----------------------------
ALTER TABLE "public"."oauth2_authorization" ADD CONSTRAINT "oauth2_authorization_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_authorization_consent
-- ----------------------------
ALTER TABLE "public"."oauth2_authorization_consent" ADD CONSTRAINT "oac_pkey" PRIMARY KEY ("principal_name", "registered_client_id");

-- ----------------------------
-- Primary Key structure for table oauth2_registered_client
-- ----------------------------
ALTER TABLE "public"."oauth2_registered_client" ADD CONSTRAINT "oauth2_registered_client_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table scheduled_log
-- ----------------------------
CREATE INDEX "idx_task_key" ON "public"."scheduled_log" USING btree (
  "task_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_task_key_start_time" ON "public"."scheduled_log" USING btree (
  "start_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table scheduled_log
-- ----------------------------
ALTER TABLE "public"."scheduled_log" ADD CONSTRAINT "scheduled_log_pkey" PRIMARY KEY ("id");

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
CREATE INDEX "idx_scheduled_log_centralized_success_time" ON "public"."scheduled_log_centralized" USING btree (
  "success_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table scheduled_log_centralized
-- ----------------------------
ALTER TABLE "public"."scheduled_log_centralized" ADD CONSTRAINT "custom_scheduled_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table scheduled_task
-- ----------------------------
CREATE INDEX "idx_scheduled_task" ON "public"."scheduled_task" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "task_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table scheduled_task
-- ----------------------------
ALTER TABLE "public"."scheduled_task" ADD CONSTRAINT "scheduled_task_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dept
-- ----------------------------
CREATE INDEX "idx_dept_code" ON "public"."sys_dept" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dept_name" ON "public"."sys_dept" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dept_pid" ON "public"."sys_dept" USING btree (
  "pid" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dept_tenant_id" ON "public"."sys_dept" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "un_dept_code" UNIQUE ("tenant_id", "unique_key", "code");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------
CREATE INDEX "idx_dict_code" ON "public"."sys_dict" USING btree (
  "dict_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_dict_dict_code" ON "public"."sys_dict" USING btree (
  "dict_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dict_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE INDEX "idx_type_dict_code" ON "public"."sys_dict_type" USING btree (
  "dict_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_dict_type_dict_code" ON "public"."sys_dict_type" USING btree (
  "dict_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_file
-- ----------------------------
CREATE INDEX "idx_linked_table" ON "public"."sys_file" USING btree (
  "linked_table" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_linked_table_id" ON "public"."sys_file" USING btree (
  "linked_table_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_sys_file_path" ON "public"."sys_file" USING btree (
  "path" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_file
-- ----------------------------
ALTER TABLE "public"."sys_file" ADD CONSTRAINT "sys_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_history_record
-- ----------------------------
CREATE INDEX "idx_operator" ON "public"."sys_history_record" USING btree (
  "create_user" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_table_name" ON "public"."sys_history_record" USING btree (
  "table_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_table_pk" ON "public"."sys_history_record" USING btree (
  "primary_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "primary_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_history_record
-- ----------------------------
ALTER TABLE "public"."sys_history_record" ADD CONSTRAINT "sys_history_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_menu
-- ----------------------------
CREATE INDEX "fk_pid" ON "public"."sys_menu" USING btree (
  "parent_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_parent_id" ON "public"."sys_menu" USING btree (
  "parent_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_menu_name" ON "public"."sys_menu" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_notice_user
-- ----------------------------
CREATE INDEX "idx_user_id_read_status" ON "public"."sys_notice_user" USING btree (
  "status" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_notice_user
-- ----------------------------
ALTER TABLE "public"."sys_notice_user" ADD CONSTRAINT "sys_notice_user_pkey" PRIMARY KEY ("notice_id", "related_id", "notice_type");

-- ----------------------------
-- Indexes structure for table sys_oauth2_client
-- ----------------------------
CREATE UNIQUE INDEX "sys_oauth2_client_un" ON "public"."sys_oauth2_client" USING btree (
  "client_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_oauth2_client
-- ----------------------------
ALTER TABLE "public"."sys_oauth2_client" ADD CONSTRAINT "sys_oauth2_client_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_params
-- ----------------------------
CREATE UNIQUE INDEX "uk_params_params_key" ON "public"."sys_params" USING btree (
  "params_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_params
-- ----------------------------
ALTER TABLE "public"."sys_params" ADD CONSTRAINT "sys_params_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_permission
-- ----------------------------
CREATE INDEX "idx_perm_menuid" ON "public"."sys_permission" USING btree (
  "menu_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_permission
-- ----------------------------
ALTER TABLE "public"."sys_permission" ADD CONSTRAINT "sys_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_permission_group
-- ----------------------------
CREATE UNIQUE INDEX "uk_permission_group_name" ON "public"."sys_permission_group" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_permission_group
-- ----------------------------
ALTER TABLE "public"."sys_permission_group" ADD CONSTRAINT "sys_permission_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE INDEX "idx_sys_role_code" ON "public"."sys_role" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_tenant_id" ON "public"."sys_role" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_sys_role_code" ON "public"."sys_role" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role_dept
-- ----------------------------
CREATE INDEX "idx_role_dept_dept_id" ON "public"."sys_role_dept" USING btree (
  "dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_role_dept_role_id" ON "public"."sys_role_dept" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "uk_role_dept_id" UNIQUE ("role_id", "dept_id");
COMMENT ON CONSTRAINT "uk_role_dept_id" ON "public"."sys_role_dept" IS '一个角色只能关联一个部门一次';

-- ----------------------------
-- Primary Key structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "sys_role_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("role_id", "menu_id");

-- ----------------------------
-- Primary Key structure for table sys_role_permission
-- ----------------------------
ALTER TABLE "public"."sys_role_permission" ADD CONSTRAINT "sys_role_permission_pkey" PRIMARY KEY ("role_id", "permission_id");

-- ----------------------------
-- Indexes structure for table sys_tenant
-- ----------------------------
CREATE INDEX "idx_tenant_tenant_id" ON "public"."sys_tenant" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_sys_tenant_id" ON "public"."sys_tenant" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_sys_tenant_name" ON "public"."sys_tenant" USING btree (
  "tenant_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."numeric_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "uk_tenant_tenant_id" UNIQUE ("tenant_id");
COMMENT ON CONSTRAINT "uk_tenant_tenant_id" ON "public"."sys_tenant" IS '租户名不能重复';

-- ----------------------------
-- Primary Key structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "idx_sys_user_phone" ON "public"."sys_user" USING btree (
  "phone" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_user_username" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_username" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_user_name" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."uk_user_name" IS '用户名重复';
CREATE UNIQUE INDEX "uk_user_phone" ON "public"."sys_user" USING btree (
  "phone" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "unique_key" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."uk_user_phone" IS '用户手机号重复';

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user_dept
-- ----------------------------
CREATE INDEX "idx_user_dept_dept_id" ON "public"."sys_user_dept" USING btree (
  "dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_user_dept_user_id" ON "public"."sys_user_dept" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_user_dept
-- ----------------------------
ALTER TABLE "public"."sys_user_dept" ADD CONSTRAINT "uk_user_dept_id" UNIQUE ("user_id", "dept_id");
COMMENT ON CONSTRAINT "uk_user_dept_id" ON "public"."sys_user_dept" IS '一个用户和一个部门只能关联一次';

-- ----------------------------
-- Primary Key structure for table sys_user_dept
-- ----------------------------
ALTER TABLE "public"."sys_user_dept" ADD CONSTRAINT "用户部门关联表_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user_online
-- ----------------------------
CREATE INDEX "idx_online_username" ON "public"."sys_user_online" USING btree (
  "user_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."idx_online_username" IS '用户名，会用来查询';
CREATE INDEX "uni_online_jti" ON "public"."sys_user_online" USING btree (
  "jti" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."uni_online_jti" IS 'jwt token 只能有一个管理';

-- ----------------------------
-- Primary Key structure for table sys_user_online
-- ----------------------------
ALTER TABLE "public"."sys_user_online" ADD CONSTRAINT "sys_user_online_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("user_id", "role_id");

-- ----------------------------
-- Indexes structure for table sys_user_tenant
-- ----------------------------
CREATE UNIQUE INDEX "uk_user_tenant" ON "public"."sys_user_tenant" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_user_tenant
-- ----------------------------
ALTER TABLE "public"."sys_user_tenant" ADD CONSTRAINT "sys_user_tenant_pkey" PRIMARY KEY ("user_id", "tenant_id");

-- ----------------------------
-- Indexes structure for table t_online_doc
-- ----------------------------
CREATE UNIQUE INDEX "uk_tif_form_name" ON "public"."t_online_doc" USING btree (
  "unique_key" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."uk_tif_form_name" IS '表单名是唯一的';

-- ----------------------------
-- Primary Key structure for table t_online_doc
-- ----------------------------
ALTER TABLE "public"."t_online_doc" ADD CONSTRAINT "t_investigation_form_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_online_doc_permit
-- ----------------------------
CREATE INDEX "idx_tifs_form_id" ON "public"."t_online_doc_permit" USING btree (
  "doc_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table t_online_doc_permit
-- ----------------------------
ALTER TABLE "public"."t_online_doc_permit" ADD CONSTRAINT "t_investigation_form_share_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_vue_template
-- ----------------------------
ALTER TABLE "public"."t_vue_template" ADD CONSTRAINT "t_vue_template_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table undo_log
-- ----------------------------
CREATE UNIQUE INDEX "ux_undo_log" ON "public"."undo_log" USING btree (
  "xid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "branch_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table undo_log
-- ----------------------------
ALTER TABLE "public"."undo_log" ADD CONSTRAINT "undo_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("username");

-- ----------------------------
-- Foreign Keys structure for table api_log
-- ----------------------------
ALTER TABLE "public"."api_log" ADD CONSTRAINT "fk_api_log_tenid" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("tenant_id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_api_log_tenid" ON "public"."api_log" IS '关联租户表';

-- ----------------------------
-- Foreign Keys structure for table authorities
-- ----------------------------
ALTER TABLE "public"."authorities" ADD CONSTRAINT "fk_authorities_users" FOREIGN KEY ("username") REFERENCES "public"."users" ("username") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_design_permissions
-- ----------------------------
ALTER TABLE "public"."lf_design_permissions" ADD CONSTRAINT "fk_design_d_id" FOREIGN KEY ("design_id") REFERENCES "public"."lf_design" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_edges
-- ----------------------------
ALTER TABLE "public"."lf_edges" ADD CONSTRAINT "fk_edges_process_id" FOREIGN KEY ("process_id") REFERENCES "public"."lf_process" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_edges" ADD CONSTRAINT "fk_edges_s_node_id" FOREIGN KEY ("source_node_id") REFERENCES "public"."lf_nodes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_edges" ADD CONSTRAINT "fk_edges_t_node_id" FOREIGN KEY ("target_node_id") REFERENCES "public"."lf_nodes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_form_release
-- ----------------------------
ALTER TABLE "public"."lf_form_release" ADD CONSTRAINT "fk_form_release_f_i" FOREIGN KEY ("form_id") REFERENCES "public"."lf_form" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_history
-- ----------------------------
ALTER TABLE "public"."lf_history" ADD CONSTRAINT "fk_node_id" FOREIGN KEY ("node_id") REFERENCES "public"."lf_nodes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_history" ADD CONSTRAINT "fk_process_id" FOREIGN KEY ("process_id") REFERENCES "public"."lf_process" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_nodes
-- ----------------------------
ALTER TABLE "public"."lf_nodes" ADD CONSTRAINT "fk_nodes_process_id" FOREIGN KEY ("process_id") REFERENCES "public"."lf_process" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_present_process
-- ----------------------------
ALTER TABLE "public"."lf_present_process" ADD CONSTRAINT "fk_present_n_id" FOREIGN KEY ("node_id") REFERENCES "public"."lf_nodes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_present_process" ADD CONSTRAINT "fk_present_p_id" FOREIGN KEY ("process_id") REFERENCES "public"."lf_process" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_process
-- ----------------------------
ALTER TABLE "public"."lf_process" ADD CONSTRAINT "fk_design_id" FOREIGN KEY ("design_id") REFERENCES "public"."lf_design" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_process" ADD CONSTRAINT "fk_release_id" FOREIGN KEY ("release_id") REFERENCES "public"."lf_release" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_release
-- ----------------------------
ALTER TABLE "public"."lf_release" ADD CONSTRAINT "fk_release_design_id" FOREIGN KEY ("design_id") REFERENCES "public"."lf_design" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_release_permissions
-- ----------------------------
ALTER TABLE "public"."lf_release_permissions" ADD CONSTRAINT "fk_release_p_re_id" FOREIGN KEY ("release_id") REFERENCES "public"."lf_release" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lf_todo
-- ----------------------------
ALTER TABLE "public"."lf_todo" ADD CONSTRAINT "fk_todo_d_id" FOREIGN KEY ("design_id") REFERENCES "public"."lf_design" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_todo" ADD CONSTRAINT "fk_todo_n_id" FOREIGN KEY ("node_id") REFERENCES "public"."lf_nodes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."lf_todo" ADD CONSTRAINT "fk_todo_p_id" FOREIGN KEY ("process_id") REFERENCES "public"."lf_process" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "fk_dept_pid" FOREIGN KEY ("pid") REFERENCES "public"."sys_dept" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "fk_menu_id" FOREIGN KEY ("parent_id") REFERENCES "public"."sys_menu" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_menu_id" ON "public"."sys_menu" IS '级联关联菜单表';

-- ----------------------------
-- Foreign Keys structure for table sys_notice_user
-- ----------------------------
ALTER TABLE "public"."sys_notice_user" ADD CONSTRAINT "fk_notice_user_n_id" FOREIGN KEY ("notice_id") REFERENCES "public"."sys_notice" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_notice_user_n_id" ON "public"."sys_notice_user" IS '关联通知表';

-- ----------------------------
-- Foreign Keys structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "fk_role_tenantid" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("tenant_id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_role_tenantid" ON "public"."sys_role" IS '关联租户表';

-- ----------------------------
-- Foreign Keys structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "fk_role_dept_dept_id" FOREIGN KEY ("dept_id") REFERENCES "public"."sys_dept" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "fk_role_dept_role_id" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_role_dept_dept_id" ON "public"."sys_role_dept" IS '关联部门表';
COMMENT ON CONSTRAINT "fk_role_dept_role_id" ON "public"."sys_role_dept" IS '关联角色表';

-- ----------------------------
-- Foreign Keys structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "fk_role_menu_menu_id" FOREIGN KEY ("menu_id") REFERENCES "public"."sys_menu" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "fk_role_menu_role_id" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_role_menu_menu_id" ON "public"."sys_role_menu" IS '关联菜单表';
COMMENT ON CONSTRAINT "fk_role_menu_role_id" ON "public"."sys_role_menu" IS '关联角色表';

-- ----------------------------
-- Foreign Keys structure for table sys_role_permission
-- ----------------------------
ALTER TABLE "public"."sys_role_permission" ADD CONSTRAINT "fk_role_perm_permid" FOREIGN KEY ("permission_id") REFERENCES "public"."sys_permission" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_role_permission" ADD CONSTRAINT "fk_role_perm_roleid" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_role_perm_permid" ON "public"."sys_role_permission" IS '关联权限表';
COMMENT ON CONSTRAINT "fk_role_perm_roleid" ON "public"."sys_role_permission" IS '关联角色表';

-- ----------------------------
-- Foreign Keys structure for table sys_user_dept
-- ----------------------------
ALTER TABLE "public"."sys_user_dept" ADD CONSTRAINT "fk_user_dept_dept_id" FOREIGN KEY ("dept_id") REFERENCES "public"."sys_dept" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_user_dept" ADD CONSTRAINT "fk_user_dept_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_user_dept_dept_id" ON "public"."sys_user_dept" IS '关联部门表';
COMMENT ON CONSTRAINT "fk_user_dept_user_id" ON "public"."sys_user_dept" IS '关联用户表';

-- ----------------------------
-- Foreign Keys structure for table sys_user_online
-- ----------------------------
ALTER TABLE "public"."sys_user_online" ADD CONSTRAINT "fk_user_ol_tenid" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("tenant_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_user_online" ADD CONSTRAINT "fk_user_ol_userid" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_user_ol_tenid" ON "public"."sys_user_online" IS '关联租户表';
COMMENT ON CONSTRAINT "fk_user_ol_userid" ON "public"."sys_user_online" IS '关联用户表';

-- ----------------------------
-- Foreign Keys structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "fk_user_role_roleid" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "fk_user_role_userid" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_user_role_roleid" ON "public"."sys_user_role" IS '关联角色表';
COMMENT ON CONSTRAINT "fk_user_role_userid" ON "public"."sys_user_role" IS '关联用户表';

-- ----------------------------
-- Foreign Keys structure for table sys_user_tenant
-- ----------------------------
ALTER TABLE "public"."sys_user_tenant" ADD CONSTRAINT "fk_user_tenant_tenid" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("tenant_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sys_user_tenant" ADD CONSTRAINT "fk_user_tenant_userid" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
COMMENT ON CONSTRAINT "fk_user_tenant_tenid" ON "public"."sys_user_tenant" IS '关联租户表';
COMMENT ON CONSTRAINT "fk_user_tenant_userid" ON "public"."sys_user_tenant" IS '关联用户表';
