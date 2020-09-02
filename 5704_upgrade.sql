-- ----------------------------
-- Upgrade table `project`
-- ----------------------------

ALTER TABLE `project`
ADD COLUMN `begin` VARCHAR(128) DEFAULT NULL AFTER `progress`;
ALTER TABLE `project`
ADD COLUMN `end` VARCHAR(128) DEFAULT NULL AFTER `begin`;


-- ----------------------------
-- Upgrade table `achievement`
-- ----------------------------

ALTER TABLE `achievement`
ADD COLUMN `progress` VARCHAR(255) DEFAULT NULL AFTER `number`;
ALTER TABLE `achievement`
ADD COLUMN `apply_time` VARCHAR(128) DEFAULT NULL AFTER `progress`;
ALTER TABLE `achievement`
ADD COLUMN `accept_time` VARCHAR(128) DEFAULT NULL AFTER `apply_time`;
ALTER TABLE `achievement`
ADD COLUMN `authorize_time` VARCHAR(128) DEFAULT NULL AFTER `accept_time`;

