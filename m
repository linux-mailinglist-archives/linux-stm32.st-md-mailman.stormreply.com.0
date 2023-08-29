Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5B78C647
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 15:41:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF59C6A61D;
	Tue, 29 Aug 2023 13:41:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C13BC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 13:41:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TBwgZB019602; Tue, 29 Aug 2023 15:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=YRG7/1LKonbXReVVMUzYv6d5sYbYplVCZHB7ICikVjE=; b=b4
 TV0rmKjy7gKGpMJIzHDi1cjDRl3JOpB2Gmnc+KCywe+vrB1NrwlHDu8KIFE1rZ2s
 j3CjqacchVgAdIx9P6TWIoirNcKPdIC8u6ujH23Ppc5YV55TwseKaxBlYtXgVoiV
 Vxg232uMKYSFDq1hAaC3mA8Xszj0tRe02LF8H5E/ywpf9XTrNP6xe0k5YGbufY/v
 TqncmDOjC5OV1EbCkk2wojCFSOeEIiqcj2Wf2mDrCw81ETCUfAsbtq/7SYCEkIXs
 AWNDJ8Dy8XX/mVpSMUFqXHHJPMp/SuuntJgiFqHPEanMvx+Ua/3W6XsZ7DIunjAM
 s4FlvpxOuKHwQgPt0XTg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq6tfmchf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 15:40:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBB7E100057;
 Tue, 29 Aug 2023 15:40:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBC612207DB;
 Tue, 29 Aug 2023 15:40:55 +0200 (CEST)
Received: from localhost (10.201.22.39) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 29 Aug
 2023 15:40:54 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>, <lee@kernel.org>
Date: Tue, 29 Aug 2023 15:40:22 +0200
Message-ID: <20230829134029.2402868-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_10,2023-08-29_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] counter: chrdev: fix getting array
	extensions
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

When trying to watch a component array extension, and the array isn't the
first extended element, it fails as the type comparison is always done on
the 1st element. Fix it by indexing the 'ext' array.

Example on a dummy struct counter_comp:
static struct counter_comp dummy[] = {
	COUNTER_COMP_DIRECTION(..),
	...,
	COUNTER_COMP_ARRAY_CAPTURE(...),
};
static struct counter_count dummy_cnt = {
	...
	.ext = dummy,
	.num_ext = ARRAY_SIZE(dummy),
}

Currently, counter_get_ext() returns -EINVAL when trying to add a watch
event on one of the capture array element in such example.

Fixes: d2011be1e22f ("counter: Introduce the COUNTER_COMP_ARRAY component type")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/counter/counter-chrdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
index 80acdf62794a..afc94d0062b1 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -247,8 +247,8 @@ static int counter_get_ext(const struct counter_comp *const ext,
 		if (*id == component_id)
 			return 0;
 
-		if (ext->type == COUNTER_COMP_ARRAY) {
-			element = ext->priv;
+		if (ext[*ext_idx].type == COUNTER_COMP_ARRAY) {
+			element = ext[*ext_idx].priv;
 
 			if (component_id - *id < element->length)
 				return 0;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
