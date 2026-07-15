Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DF/zFzuQV2qSXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 15:50:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D475EFD0
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 15:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=B+9HWO8W;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D853C8F274;
	Wed, 15 Jul 2026 13:50:50 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012046.outbound.protection.outlook.com [40.107.75.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F187CC7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 13:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhg92KCR1F3Z24btjoUy/GsxCHijjhazg8xvIFeVDfz3ADV7YYouc0SCmEd8piNPfuG3cGT/7WUCnLTQdPxoVmw0dKwFiRwpOyMe/Gf0thoniPipTpTkRWVgMwGLvhPkYWSJUW1Pzye8aTTKVmDhAUkjbHOJsOgCd7R0739dKMxsCvj1pBw2hs7h5EjEwLA8gTG41LXR0F2Zho5aangRfQftO314RBAdbJSYXZnH2aT2SgtYTvFilOSnodw1yS3ctS1QE31BrGKr9scdbxMYZwJlIHQmwq6dF5kjSUWMx5euDQDuXy13PMqoN3EUm9rUH0Jtszrc2VyNVF6KwBqjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlMmABHURfgFO/daGhOyDVSFyXjuWEBaxvTIUoqfyqk=;
 b=r9bn0jWDQn61UiuulCyf5mv0f3I/fKamu1J2Px9wvwB4pamJ2EEVNK3s+50olamdfDpYgm8JDOQ0lKvQSGtYQU+DyY4V2Hpv0HpVS1wvxoNBCHQd+YZE2iUMXAC6dEQoI5+evFTS4vdIpQlbWzA0bEZ9AA9tH6KybSiNNYaiJBua1ZRvMGXLlZBWSvo0A9sYutKR09Fp4B9BMIn3ukcg8pCz88E/Gy0zjzlKoU2eDxq7yMH66ijIRFd8phGf9QCnDyOeoRMvX5CFsQDQ0y1NeXquGawBYWAtQWdVZkRFFNM4J7si7hsGht3EwpFj605cPfchvgMkLddOkE5T+h4JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlMmABHURfgFO/daGhOyDVSFyXjuWEBaxvTIUoqfyqk=;
 b=B+9HWO8WN4fyw9iefG+O7hBGAwvA8PPVQM5hxV07VVRAbtHqmNizOHZ4cxnMZ3cSdy2v6AhtQSJ44i5vUW5wgW+DsGstE3aFLJQpGnIF/6MNSjVFsPeJZEAdXnILdZZtyoPtelArEKYQx47LmRcHRJPHt6gyXiAzeAKkXgFEPdKxyjqC+r49TyjcEPB+tzmZrXgsYFEY5Pqef3+0oSKY/paHBK42b2rkFJkffA6CWi1bbkA1tZlxF+MpeUxHPi9+utE7LBoaBBFztiLBtVfIjRVxqLUfMuGMUxaaead960SlNFH6l96XAzWM9S6lLi5es0IlMSnEBdCQScs1rq4nzQ==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8658.apcprd06.prod.outlook.com (2603:1096:4:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 13:50:44 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:50:44 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
 David Lechner <david@lechnology.com>,
 linux-iio@vger.kernel.org (open list:COUNTER SUBSYSTEM),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list),
 linux-omap@vger.kernel.org (open list:TI ENHANCED CAPTURE (eCAP) DRIVER)
Date: Wed, 15 Jul 2026 21:50:27 +0800
Message-Id: <20260715135030.326290-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65c303-0a63-46cc-8245-08dee27810d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|7416014|52116014|366016|6133799003|56012099006|11063799006|38350700014|921020|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: OEPzfhHfjqVVs3upOUpY0l5DRAJwn5w8z7t412HhAoqqPbNFXeighqAda3mkEez2BpgG76YjQKw+WW8Xln9kjyCtCnykZJJT2mMPRW9A2E38lbqa7Tdh3jOCDZK+wrD30B/fFjnCU1dz5T84yr5wjrjAKarwbtrSO1VoO5DYNcejMJ44mlMh1xZc5dkUATalWSccYK9xLfXKfqoU12yknNgShjV/87YoG8WWA0dkgUNOEguaPhLurXfTV9GJfFUiCqDzimFMGSi0za45cbe6NYmXB2UMgB8O+nLRzCn6lKHB6FBaaPfJ5zAZYkPJ4AhIe3PTnLnS3sHJWXQ7xmyxOxspbh/sXdlpVBCglAh2IRUK4k3Uu2HvmWkM1hjCLrH1ICxyLKNAgvyNbDwr9XGGp0ymxeHiupsqu89wOP08StR76p0alSU1ZtWU9fYTU3sF9e4jcCyMxx5H9MK66uXdWKFyvYw5aHdO0EO6BgVVr7GyouK0NY3qkvZ3mMUtUbp6Vu8Qbd9+0eeO47peazus61ljYbW+smgeuKqfKJwFHY0Dq1Tq6UyjoTYdjIYmG5HesASeLjAzD9mMRJlRSiOI6HXNzZ6MH+DN5YJM2oRHm4+/nXWm45OEV/TeITS/JArwYG1GtCVjsvaArCk0pntbRFUr1gwV1fBcoy1boDRRVl+HEmDSwmgYdu5fW0uyiHS0iFlZd0qMepJb8hrG7coBsCX2N+wqE7PRtO32oqxuuX5akIyto0ITIeXK5qvK4jBn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(52116014)(366016)(6133799003)(56012099006)(11063799006)(38350700014)(921020)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gXMNFWjNA849YJfLfW9RWa/QZfGlo4FgssxusWtxlIkEuG/2orcMnQrauWIo?=
 =?us-ascii?Q?O90cdqEovnQ1/BLMt2HRQeuLVEBVpJI9fdWxqiIurYFDQQ752iemxU7wr3p3?=
 =?us-ascii?Q?qgNfSd5BHxbA7HCevi3ySGmS6+nhQC8UW7cifI7Zja99gO+YfM5Lo3m1Tb+j?=
 =?us-ascii?Q?sx2YXnMTErJRJeQjC48lRbXn74li0L9xS4OIqOpGsPMhMya4q8Y6w/bIX5RK?=
 =?us-ascii?Q?VUboZuYpn7806q4R7xjQr1kLDsmsRop03RSyM1BNVUb0lhwdHn5OK1iBwtfq?=
 =?us-ascii?Q?0jDBlAYQToW9l+AzDVAzAdQEvsHqA1qq/yNNTzvr1log/58VDNjBbEGPpTFq?=
 =?us-ascii?Q?wkyB3R0iBWVB5sxXx4rDBJ3weqJ0LXEw2VCtNXop0AxjtMUtAm8xnMl9fdlm?=
 =?us-ascii?Q?fzh0GWny6mXEWXptTL12tHdp1S93hYG8FbWP2TMzzoavG34FCWW/ALdQhYFN?=
 =?us-ascii?Q?k2ybffXU1g+9eYk0w/0B3C1E29VTMH6VQVLf3L0iLpDJrDweylX2ykwr+pgh?=
 =?us-ascii?Q?2JKxe6IEI2XHMH9ddxjEr1XNGmg9aVKrBmNqDUI/IIOuIyIJYqdkd1+PVFBP?=
 =?us-ascii?Q?TJBWF4Zhw2FMxFMBNIANtk1FumAa0pMYtHr4QMV72W+IbEgTAoXlUTc4y0qX?=
 =?us-ascii?Q?T9QHIB10FVxe0b7Oa7RxkFqkIjb45fmSRsx+Mm+i26p7utTC77IQa1IOPXq2?=
 =?us-ascii?Q?BeFIv7u1JHT+u/IdFA7pfd+aP0Y0e11ySpDM/nl+9cyu1BT8XZgAty3Z5n2y?=
 =?us-ascii?Q?T3JWGb99EQVZpdrH1zgS6qk/QpAhHfTEaOOToxtRETxXAwIHJaLrm3YACi8J?=
 =?us-ascii?Q?sKqtHGUtWyS1Mm68BEOmrFLdsF8mea7o6e6mTNm8x7JS5/KzFe/5BkC7DlLS?=
 =?us-ascii?Q?ieKHgw5TiXakUyHEBpvTySQfnHALxEU12lzfrKbsM4doRg97Smm2q4qiZCJ1?=
 =?us-ascii?Q?PjiumvtyiohvenGhLLB6eZOWaVgf6sA0CX4u180kEv84BJx4bjz4UuJGIWej?=
 =?us-ascii?Q?0+hjV5GiQpZHWQWQFajZ1WPIahYBM6oDqJOZFYsHUEVsGEUQK69jSoymIDpm?=
 =?us-ascii?Q?6mtWabCGvePxy9uN3pVVibWig/YqevCeLMD+8p4hMayyRbnPc7GQUShSFKnw?=
 =?us-ascii?Q?Le/L61OIDMVa0a/nTRwSyszk5HVXeo5SBrsI4KcoCxitNdHM/WyKP1nCKkYs?=
 =?us-ascii?Q?YDJVbSDxhOB+J5EKb+jYAZJKFiukGbSgTe9K/mK5ZarTiexxp3524vlT/qAt?=
 =?us-ascii?Q?SL/A/PbMhkq77fNnGbJKSx/zyYX6wQoez/cWsZID1qMZpTeYojQnhcTrXAZm?=
 =?us-ascii?Q?q1uBR9apWLDAhme6/g6fMc9VHH+MG5HhfWitrdYcsahPShjbG2+qa5ANZM3Q?=
 =?us-ascii?Q?c+mnqRv4hPN1zQOzvTF8dg1QUJI3LCQuN/6pesqGrjqS5rPsW4w08FJ4w39t?=
 =?us-ascii?Q?8rBQ0k8PSVEGDbkiwtCuT/pGVPSMOlrtBGJYbfiy5KJ6vHOsn1H0fHUXVsJn?=
 =?us-ascii?Q?L6QhsvlPYqdIffK2lqu9BVX+C7/SOFNRvKVFxYnWeSF1UTzYBHZAKIRjhetp?=
 =?us-ascii?Q?jK+kjMDjFwQqwMKsiem+njThbuWV1F8dVnmECBU6MHXOnnqjm4eGtoYJyILE?=
 =?us-ascii?Q?C3Us4KtkKMuoxbo5AITnxJWAel13PRTEQZpF+VRTTO15KUVMzHpJsDmSQTES?=
 =?us-ascii?Q?2juheK26sZiZdfrIGF9YHkoz6IirfGj25ww06fFZOpSuFTnlK8puh8mbUW5F?=
 =?us-ascii?Q?rmQCpFK1Jw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65c303-0a63-46cc-8245-08dee27810d5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:50:44.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBqmf1z+JkWTxpHWFtVEto1chqMfuB9W79WNK1CLJ6d8fBfYWQ5Ns/o239M7RQ2uHuOscupKNU1BCHCIiRnzqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8658
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [Linux-stm32] [PATCH 0/3] counter: Remove redundant error messages
	on IRQ request failure
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:wbg@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vigneshr@ti.com,m:jpanis@baylibre.com,m:david@lechnology.com,m:linux-iio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:panchuang@vivo.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,ti.com,baylibre.com,lechnology.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.209.6.89:from];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[40.107.75.46:received,2603:1096:101:c8::12:received];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,vivo.com:from_mime,vivo.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9D475EFD0
X-Rspamd-Action: add header
X-Spam: Yes

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in counter drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (3):
  counter: stm32-timer-cnt: Remove redundant dev_err()
  counter: ti-ecap-capture: Remove redundant dev_err_probe()
  counter: ti-eqep: Remove redundant dev_err_probe()

 drivers/counter/stm32-timer-cnt.c | 10 ++--------
 drivers/counter/ti-ecap-capture.c |  2 +-
 drivers/counter/ti-eqep.c         |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
