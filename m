Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AE3A091B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53037C58D5C;
	Wed,  9 Jun 2021 01:32:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95CB0C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:41 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so425718pjp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqW2hWGxH1OOe0tpNz1yPTnzMBBEZl3N8Vv1hrlk7eY=;
 b=Nwj+0+En9LAEEELUjvHh1yiB0ynXLXG4RFBZXEri+yqNmldJc2IE4/nh9igsetTZKi
 Lu4b3QWO0Sz8vFmUgxKOjDlvhWJEY32U/ZTtjrRcEV55PZIFdgL7Zr16tsxBPuhZJWQ7
 7Cuwbw12cugFOr/41seJFulF3a15USU+VXWNMOCTOiwJwMX2dtO5u+v2DXryQk7vMrTG
 Hy28k4yfWUwYT3sMngurgN11ZArDAVEOK2/rBPIbrO8bJlsXlKy24NJ+XcXQ1hZg2Jq+
 EYp5iDt3FIS7vFv0vsaqiY7uUeGRpkH0B2NYl/VipwrG5QNIRteRwBwYU9MxPCUOCbuZ
 gSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqW2hWGxH1OOe0tpNz1yPTnzMBBEZl3N8Vv1hrlk7eY=;
 b=hAfctOiqqq5EhR7G06YWTwpO0QNGPthL60TXL2iCYVZ6fKvNoabsdsVvHWPiZYg906
 0tRNayfllmWrCWRwoP6+Qh71KqTVVy4TOsbHwTFzfDopIKoGX24ENw7ch68wLLSWJnHe
 fgMVCBdUSyo0PaQMo/tztaMNqsKZym9133X1mGK90F7umrHQrp4qfye6M4rfe4EC+bYM
 B9huTcpzYnTEbVxpJOUSeFPlLHL1wAt5OfiG1ZwktWc1SxAyQeTFM/nSB7XR6YmiFDT+
 9ROvC4eW/69hTitWSNQVLn16YPJByowazakViw/eXiYm6e3xGmIpCV7fJQhyJKhWO7YI
 OHNQ==
X-Gm-Message-State: AOAM531Ed5PTKMSwue4bXRUocAa5yIE+aIAzOHZwlaQdpZe72Yphxxlp
 0Dq8WBwFFgVRkLWrJtwuCjQ=
X-Google-Smtp-Source: ABdhPJwzVmCoWtk/cZUjfOEW6VN4qsVxVG/KIj5Bzr+YUe1hi5gnlL4e546ZGpDATbkNjxrdrG3x2w==
X-Received: by 2002:a17:902:dac3:b029:105:66fc:8ed7 with SMTP id
 q3-20020a170902dac3b029010566fc8ed7mr3030662plx.6.1623202360188; 
 Tue, 08 Jun 2021 18:32:40 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:39 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:13 +0900
Message-Id: <08830119594acdb3bc9d36ae2e65b2eb26589ade.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 10/33] counter: stm32-lptimer-cnt: Add
	const qualifier for functions_list array
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

The struct counter_count functions_list member expects a const enum
counter_count_function array. This patch adds the const qualifier to the
stm32_lptim_cnt_functions to match functions_list.

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 937439635d53..0f7d3f1ec1b6 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -134,7 +134,7 @@ enum stm32_lptim_cnt_function {
 	STM32_LPTIM_ENCODER_BOTH_EDGE,
 };
 
-static enum counter_count_function stm32_lptim_cnt_functions[] = {
+static const enum counter_count_function stm32_lptim_cnt_functions[] = {
 	[STM32_LPTIM_COUNTER_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[STM32_LPTIM_ENCODER_BOTH_EDGE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
 };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
