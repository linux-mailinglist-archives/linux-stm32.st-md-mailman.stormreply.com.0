Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC139BC1F6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 01:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8078C6DD9E;
	Tue,  5 Nov 2024 00:24:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89289C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 00:24:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4DC57A41AEF;
 Tue,  5 Nov 2024 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436AEC4CECE;
 Tue,  5 Nov 2024 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730766272;
 bh=N8R3fDb+9GoIdsgF7CbDktor2ZvxI5MJHHQBCkOSUKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h18njW74apSBbpuu3iVuuWcC1ZiFx0DjnJ+pzstG1XBqh+B7rcZsaopjIjq31JtFn
 vsAtNmmztKxPwOVJr1iu3+I3kxA4jFy1iTEZjlp9ghbY+uKyDpDsdcdUVUdCTR7AQW
 fRHuKGhlFechFWqMyuyoJ5Y6gLR11hCoWQiHWzJZp6FN/T1yo8fSEZODEfzMsA0ZeU
 gwifQ+9J0wV8+GqDH+DNQ5dFwBAmfeZzupjUVxejRuPWDR3wFaCwD36qEFnC74wSRE
 O6u4vzsmS+xRpszSioj+qMc9w2HJAC/vPa0HT7yl434Hc0FfRbgeiwBZ5q/+ColXMg
 sNFTAaRhZkfDw==
From: William Breathitt Gray <wbg@kernel.org>
To: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jonathan.Cameron@huawei.com,
 benjamin.gaignard@st.com, gregkh@linuxfoundation.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue,  5 Nov 2024 09:24:20 +0900
Message-ID: <173076612183.810486.12896037496953296701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
References: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=364; i=wbg@kernel.org;
 h=from:subject:message-id; bh=nKhWV0LJIFJnrRorwflUOkORSfdeFM5elQRc/M3KIUc=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOmaqbM2i1i967eSemS+2bPWLvMJp8JbmUXiklfit6n+/
 rJyk25vRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRB1cZ/lnHeuTNYdCU+B6m
 zPnZOTviK2vjz03ri+7u60jpMmKbt4aRoY3ve67efcZv0WKL/Xa0v543a9690K4rT6OnOq1qe35
 qChMA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Add check
	for clk_enable()
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


On Mon, 04 Nov 2024 19:18:25 +0000, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> 

Applied, thanks!

[1/1] counter: stm32-timer-cnt: Add check for clk_enable()
      commit: 842c3755a6bfbfcafa4a1438078d2485a9eb1d87

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
