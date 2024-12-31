Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E79FF128
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 19:13:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1A0EC78013;
	Tue, 31 Dec 2024 18:13:35 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 631A9C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 18:13:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BD3F10486D96; Tue, 31 Dec 2024 19:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735668807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O403emxKNDKzcMRgQfG1GrGFTfNb9Kbfd9tbtbIZjU8=;
 b=IDDXN8+kYgCfloujJuN7vZyk2rAMWhueTEB92Izu88k+3JXQO61JBP7RJsUqVlEcIGSxAQ
 Nal2X6Tg5E6j4xwdygMX8nJFRIMsKh8peHnn7KWLmrloPLBVQ0X+iNV+9XXOn5XFvznoKX
 6dYp07rSeLGwlXgCc7i+MNpBxUTsukDTPudPMcOk1SW2beLfy/hQ/ADsSPgkW/2At1NkY9
 NLu/YTJjBOTA350sPAjw65Kpge4m1jAP9C4Yr2Ft7FNkOxeE4xwZiU/DS3MNZ6Y5ZFlsy1
 vL1lUOsPPk42nnPNwHvxbhkh4jhLEHA8LXvHA8ohwGSqgQhmArKA159PeJyU9Q==
Message-ID: <7e4f4613-441a-4489-837d-2b69f0364af0@denx.de>
Date: Tue, 31 Dec 2024 19:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>
References: <20241231042756.3166495-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241231042756.3166495-1-zmw12306@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8] pinctrl: stm32: Add check for
	clk_enable()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/31/24 5:27 AM, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
