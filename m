Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F2363415
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Apr 2021 08:34:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9671CC57B79;
	Sun, 18 Apr 2021 06:34:12 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 198F1C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 06:34:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618727651; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=wTwrTT5ABe6vOdGCGoDYNEPDxDX3j6+q5ecSBx+FeNA=;
 b=ND/yzQD3uUX3pZlIZT+ubfX+8K2SsvUKgnWO2wjicZm965GudCXq06DuXr2nXb6N6gPuYTK1
 F5d/M7+x3DhE8U+glK1MAcxiRLpstZQ4xUPB5t737drBvPBpaQ7N2FKKmsEWuMpbkL50LBbq
 93odNwd7REdji6tOtcDWYdjOqBE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 607bd2d6853c0a2c4615e0b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 18 Apr 2021 06:33:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E294CC4323A; Sun, 18 Apr 2021 06:33:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 MISSING_DATE,MISSING_MID,SPF_FAIL autolearn=no autolearn_force=no
 version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87919C433F1;
 Sun, 18 Apr 2021 06:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87919C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210331023557.2804128-2-wanjiabing@vivo.com>
References: <20210331023557.2804128-2-wanjiabing@vivo.com>
To: Wan Jiabing <wanjiabing@vivo.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210418063357.E294CC4323A@smtp.codeaurora.org>
Date: Sun, 18 Apr 2021 06:33:57 +0000 (UTC)
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list.pdl@broadcom.com,
 Ajay Singh <ajay.kathat@microchip.com>, Wan Jiabing <wanjiabing@vivo.com>,
 Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
 Wright Feng <wright.feng@infineon.com>, SHA-cyfmac-dev-list@infineon.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kael_w@yeah.net,
 linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>,
 Arend van Spriel <aspriel@gmail.com>,
 Chi-hsien Lin <chi-hsien.lin@infineon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [1/4] brcmfmac: Remove duplicate struct
	declaration
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

Wan Jiabing <wanjiabing@vivo.com> wrote:

> struct brcmf_bus is declared twice. One has been declared
> at 37th line. Remove the duplicate.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

2 patches applied to wireless-drivers-next.git, thanks.

d663bc3317c9 brcmfmac: Remove duplicate struct declaration
444a9af68b5c wilc1000: Remove duplicate struct declaration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210331023557.2804128-2-wanjiabing@vivo.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
