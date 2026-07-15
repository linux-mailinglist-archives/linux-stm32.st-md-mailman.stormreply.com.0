Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YT2sFzuQV2qRXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 15:50:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B389075EFCF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 15:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=ggHhQvqD;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D70AC9AE37;
	Wed, 15 Jul 2026 13:50:50 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012046.outbound.protection.outlook.com [40.107.75.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F22AC7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 13:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDj81cqeWCDEf2XYA51S4CrM3xYuApMDaxj+0tS2+qfKmBel6dYODLMmdzJveG3XGubBpjlxXyUItS26VrLJX2mZhTjGf7DgMES7UDDRnA0N39/0sx10pUR7+KTOnyS7bmXAXb2jYQv0aw8pIK4JwVftVEQlEomS9o4jbYAiYsx+8XsukPaz8x2sR7TEgcxn8MSO20XDiGiU1AsXSQLB4HSJv/D7vbEYC+AlIKb5uYL+sbpI4SQw/uktBsmt4ycIHciuN29QUsfJnJWoM2x6pwnuXU2caNgZ75ADEcBeKuu33QtyKeLid1M0DTeNXYH04UxOSney1/sGKwCQrD1H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ICzZc/YREcWG8yRzvtTOygbg4tYykMDquevJH1bhvQ=;
 b=p6kTJjAqRG+eba8osRUgpJ7zARh5eq6+82XmBBtUCItE+dtTwTS1xHuZaH7D0JcWRoF6ndfL35nZ0IqF6TSR0zpoSNE5GmnJcO107c3odclMmTdetyPSRq/WdFDI6WH9JDrAJvuI5ikBdavyKOrWEyQFDhsDgklXtvL0R9j0QQTSYKgGIbLmDblNW3CAaZtc7OnZZilu7SQ69MjP1NV8KCfw1AgIiq0q2tkiZJ9qvHv40dDCevfH0A4hBEdVJVXK9V9A8DvCInoa7Wf2ZqzbkZfMilb+mPVSHSzMa2Xq9MH6RLJLawjM+AjEsg6koeK7AbVTSyf2uPGuXtqZvSgshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ICzZc/YREcWG8yRzvtTOygbg4tYykMDquevJH1bhvQ=;
 b=ggHhQvqDSZI/Ha58OClDPWD6lfJJh1vfAaXrhnAOePkYiSA4szsnREsfUMk716pBTgpb1YwSYaX/pETV+6TPJNeT07CgZ3/RKDMEgDQc/IukTuBeIEGiB27GFNOQu4yhn2iJ4dNo7L7mAca6q8KSJyg3Xloq8N4OPrMr6/rYjOlvDIgsbbP0DLm88wlgU/faTRNy+TF7IP8MVDgMjQgZTdSwS/E/xTBiR+hIMUoiroS9n9NA+ohMrkbamDMbCk+NafYCKBtoOGg4E2O76XF8KhjjEsVp32FXnTFgjoV/z6r/odpfUNcoQsc/xHJQKVLpEFw11A331IerV92XWhu/9A==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8658.apcprd06.prod.outlook.com (2603:1096:4:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 13:50:46 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:50:46 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-iio@vger.kernel.org (open list:COUNTER SUBSYSTEM),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Wed, 15 Jul 2026 21:50:28 +0800
Message-Id: <20260715135030.326290-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715135030.326290-1-panchuang@vivo.com>
References: <20260715135030.326290-1-panchuang@vivo.com>
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 39066560-fadd-453b-a272-08dee278121b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|52116014|366016|56012099006|11063799006|38350700014|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /rPtsrvo9Mg1GsMEX06X9uYgBdU17S/jM0TAIerDm/6eJ/5JGq+81kXHvfVrEjXvDKXhPls95fKCbqr1ryYg9N5FsYAj/VPTg6G0wCC9s6dX/CdqTC72PeZf7on8W7H7Gxn8OvBO+pivYT9A59RVAkYBKIVKHVV1nI1z4DNFmXsG76Mk9alKI6DRpvmfuOH0Jts8+U1f1gF2hq4DMdgL4t6pNnsrT0mmDIy767RHuXt26AAxwVCaB0ZNs35sHUYP9ztqCOphJSp/t04kq+jqyULImXF3N2GEYcWwEk+1sZgad3tee2aw8BzHjfBSIvlfF9lWkcSUAJiA1OZwUL2irxXgq60/D3yUatvuYN7MosrN02Bk97Wa/s4FujM6mxzg1WUPs+mTaD85ovjGi8l4RgzoVAtXTCRpLv8S8omuBMaP/RF0r+MjoAfL/zzEVUWnGpFIlyRideAawzFkGBytpVo7/annIeoHWQozO/Ub1LAgs2EyUaGlFYEjEwqsPaxLWUOiZMqDhSTW3vv/QLZqZ95or6LKLqNQpqGXoz9sxa/7DeYNkAJmj/Gcgloi4T9OKGUFuqp3Jdd6FgalACCL7IG3YuPtYVlc7cC41g79fDmvpIb1NhCnS1kugu12JbevSjrIY4EflaQTI4LNhTtgPtQRrODvvswYn87zDXKhrETpNBZnQDwRgr63GiwYyv5cNAhjeHoo27v11OvpJ5esWDHADHhZ99yg3uTYAsSESZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(56012099006)(11063799006)(38350700014)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmipqyrTDzGjdun0xi/YOwEqklRkuOKMjMmvmawezFmLX29kHlD5taDrVDKh?=
 =?us-ascii?Q?qIQKija64GX4dv89gC042r5dee8FRNhwi3t1ayVmIrE97ur/iskPaoN8WQJN?=
 =?us-ascii?Q?QGbw3LEPk4rNO4GqGEnl/5oR0DMI1E9YmgGOMI6AXW0uv9xLRSd2bPGk7Y2W?=
 =?us-ascii?Q?mXE59gvkodADLeb5yPyZWyuh2PGH+Ya2GC5TUBxBRuQ0gnEmqT96IcxwLfOE?=
 =?us-ascii?Q?SOyciD4vLdzU/1Q1kMrPxYs6MbmsPJaqn5Gp+Qd4J0i1dJKmhxPcoFZuWdRP?=
 =?us-ascii?Q?7h/8ycgYJAdp6yWbtZHAYPE5Y9/XqrmQJqAELXUgDlYlcsGEYmX6QnyAqXnR?=
 =?us-ascii?Q?/AAivAO1f1PCnfiYpD02GdzFPG2WfiVze7AQExRqet6uRl252HujS7WvW9Dt?=
 =?us-ascii?Q?7ognBaNYH7qayJUcdAHmzem5+r/LU+6ghJ0CqOJFAGCy0hWmmev8YUAtNDch?=
 =?us-ascii?Q?bDP4HIPLNB8CjaqG9+bagfGHy9hCiAym06cq+iM4oUFAxaNZ/6oF+JX3t0lO?=
 =?us-ascii?Q?0RU3bF9MOo8/R6PX9vatewvamfx2pnthG5dXF7tXyvkSf+4GvFgwETOJTsC7?=
 =?us-ascii?Q?srESeqYBjvc04Oj8IbccQpuhBUU2CMjtf3hLMWp9tpSgz+LaCyaUWNwv/P4C?=
 =?us-ascii?Q?SyHg5J2GWn0XDcVfd7X/A8rZLED+X3LyDMUXw2T1yEzKki4KDn0ePTSCORQZ?=
 =?us-ascii?Q?J/qx/rTm9zz3TCIQ2sDRq55xZ4mVKJ0Mv6dZxAp9HytAoHOcy1ByNtiT8qs5?=
 =?us-ascii?Q?fC0r4Nc8K4xvmW7FUY6fdMWSSXlUjq6YR05g5+nZgU4dKf2/Lz3bP3FlGVOk?=
 =?us-ascii?Q?fZ4TGno/3W110KZS5+gNkpdzXl9Tq3Z6WzxJEPusVlRHvzqEyfpKtND6e5Zi?=
 =?us-ascii?Q?xwKYY3b1Vn6BLEWKuRgeFi1zvsZXrt3tIQbA+VSIkRHXPvUCSkC5Z27tJ+9/?=
 =?us-ascii?Q?wyvDJmJpt8ZgX3GY6dhKBYFJybbcslDZZZmhVXlZK7t70D6n/PpM/BRfbhny?=
 =?us-ascii?Q?g3Llb0n3GxH+ocUOtltkb99Xa0EcJoXMnzuiqRzh4pZghOL9vayV2aakjYt7?=
 =?us-ascii?Q?Ge+aXRbyQA/rC3WRK4+N/dv5vLGrjSePagW5xA5LqjMQKBqiQy1piHwOgNgD?=
 =?us-ascii?Q?IVGbk00xn1GFw9KLP/NsW5XGfGlA+CUM2zJq4rHsvpUl2+L+t9AX/74nhhSA?=
 =?us-ascii?Q?+6haLiil05FzXZM2JfaP2VLhHhUe7y2SvTDHmWYCa16jXBvnClapMefZzfcX?=
 =?us-ascii?Q?Rndgp4lA+NbcyaXeRPPbAFh5uK05fU2RhhkaMoPxz0MkganvcH0hemzTDGvZ?=
 =?us-ascii?Q?pVrJB8d2OFbCu7AlYQQW/mfT39ovBZ37JfjLMaPSaNdbGOx6QYvoQQeOsDER?=
 =?us-ascii?Q?AVcOJsGovO/d8xDiC97BW75RjvNvxU0QRuR++PvAIVhBt5WqkueioQvRrvP6?=
 =?us-ascii?Q?/uigzhzcxA9DRmPCUlaNJAhp5oGX6lGHp1sKuNIbjvAZFSWJWIbiOIgA9ley?=
 =?us-ascii?Q?ZelkR+qgbrNiKQmJMtYIxTcFrIbbHo/obOJy0mii0MTHrEpw3SLUaPSEJmuI?=
 =?us-ascii?Q?Q7/Al4ij9gq8yjhdd6olOrcYD5xOqGCQn1ZwlLj45F9UooXUKR96MT3jyKp5?=
 =?us-ascii?Q?pS0hYiSmkDS8OpOOZk31Jnb+XUKSQvxLr9Th3sxXVGrWnwMSyAxgFKiJFnaQ?=
 =?us-ascii?Q?cxelj/BAu/lo+ayfzZ59diNnDKi393vm2ec1qP3CRI5Vv9E46o1u0nAINiGa?=
 =?us-ascii?Q?dynTWyAqKA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39066560-fadd-453b-a272-08dee278121b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:50:46.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crcTOXXneEpSlvYfXsUEWcQO3qgrtWgoniWXMbIA3TGmAlS2Vh7m3ZBUNqN3Y2xa8mjZc1f4oWyB79zJk6fYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8658
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, Pan Chuang <panchuang@vivo.com>
Subject: [Linux-stm32] [PATCH 1/3] counter: stm32-timer-cnt: Remove
	redundant dev_err()
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:wbg@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-iio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:joshua.crofts1@gmail.com,m:panchuang@vivo.com,m:mcoquelinstm32@gmail.com,m:joshuacrofts1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.209.6.89:from];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,vivo.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[40.107.75.46:received,2603:1096:101:c8::12:received];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,vivo.com:from_mime,vivo.com:email,vivo.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B389075EFCF
X-Rspamd-Action: add header
X-Spam: Yes

devm_request_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index a3d8f7a5874e..9eee281350d0 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -759,11 +759,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 		/* All events reported through the global interrupt */
 		ret = devm_request_irq(&pdev->dev, ddata->irq[0], stm32_timer_cnt_isr,
 				       0, dev_name(dev), counter);
-		if (ret) {
-			dev_err(dev, "Failed to request irq %d (err %d)\n",
-				ddata->irq[0], ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		for (i = 0; i < priv->nr_irqs; i++) {
 			/*
@@ -775,11 +772,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 
 			ret = devm_request_irq(&pdev->dev, ddata->irq[i], stm32_timer_cnt_isr,
 					       0, dev_name(dev), counter);
-			if (ret) {
-				dev_err(dev, "Failed to request irq %d (err %d)\n",
-					ddata->irq[i], ret);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
