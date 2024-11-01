Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F99B8ACC
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 07:01:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F6F6C78034;
	Fri,  1 Nov 2024 06:01:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D73FC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 06:01:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BC6B5CB5D4;
 Fri,  1 Nov 2024 05:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FBCC4CECD;
 Fri,  1 Nov 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730440764;
 bh=bsORacs+XRwGPNAegb+drBs5u+8UfBOTbC/pTO7y+6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nVh7VB2enHZJz2ft2TzPQ6heULNsJCk/uXeTpmnaSnRpCSLN3C+NK1iX/bEEpFt6h
 2W87GxwcpSE6QV0JhzJLL4ZPyLIxWmPUk7IrZ91GhE+SvdErRpmR/bKPeYJBzVWBSF
 5nmnuQ13mIjRxAt+KZj4/QkjkcQmspvZyLu7/XXJPbnJHrzicUmDx00kFnWxVUVJj4
 LSTrz3fUPlaveJozHNHqe0b/UlpNOBQKepLyfu944Z3dH6lAnjZYmBry1ulIq0rRON
 sLVHcMBAgmPa9jd5wnj5e9StQtSQNO+qIdFGgclPRPr1SvHWBeC6itjriO85bJDkOQ
 tbuAf+2fGkghw==
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri,  1 Nov 2024 14:59:18 +0900
Message-ID: <173044055547.648361.10787383264184720457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
References: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=663; i=wbg@kernel.org;
 h=from:subject:message-id; bh=MbN8O+C+5FEujeJNUwaWgYqQSEexIAnJ9ZIqUSvRh8g=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOkquc+e8rirfDxrXaT1uHa6lYSF0KIjb/autf6fMKMth
 bvYJflDRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRdxMYGTamMhRzCfX8PB7v
 sq/R65r1lmq3+ZazZ4n3fSt9cnDGV1tGhpurmXXXnq+9fmCXyx7J5mUT/63wM+6aqJei7HLGaEV
 JIAsA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Cc: linux-iio@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix device_node
	handling in probe_encoder()
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


On Sun, 27 Oct 2024 13:26:49 +0100, Javier Carrasco wrote:
> Device nodes accessed via of_get_compatible_child() require
> of_node_put() to be called when the node is no longer required to avoid
> leaving a reference to the node behind, leaking the resource.
> 
> In this case, the usage of 'tnode' is straightforward and there are no
> error paths, allowing for a single of_node_put() when 'tnode' is no
> longer required.
> 
> [...]

Applied, thanks!

[1/1] counter: stm32-timer-cnt: fix device_node handling in probe_encoder()
      commit: 147359e23e5c9652ff8c5a98a51a7323bd51c94a

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
