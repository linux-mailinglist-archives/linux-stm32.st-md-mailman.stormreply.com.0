Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6EC39F40
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 10:58:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B45C349C4;
	Thu,  6 Nov 2025 09:58:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C2BC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 09:58:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id ED0254E41565;
 Thu,  6 Nov 2025 09:58:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9C0C6068C;
 Thu,  6 Nov 2025 09:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78B7B11850340; Thu,  6 Nov 2025 10:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762423079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=aA1Nh5vuzSHJhmK4d/Q7OkqDwftB9kBY44MgWQ5fnC0=;
 b=lhRimDfJSU530Ra+0V83y5TFQDiqg/9/f8FnAk2IKLuWRO9dy+hm+9ADz+lW3upGtpklf7
 oc0k9xOyZw3gaBO0/RbKvc/arSMN0GsZnCYYN3Wl9ENtNXGgQvinAWn12keNsQljLWTxZA
 Go7AkNluOrGI4GJUTvLgOLTANpGbNoA85WTb/yhazPiDlD7B5e0SKc9PNWpj48ss/RpWnH
 bzqZKDlSVyEJGSVq/L6kPueEPsGFjk16uJBC6HdCBL8dO1KKnSJuoIq1KnVuVSUaGxcDfS
 6hTds9FbSa0y/flYWz0aEkjN7K1spVyR+RNtsC8O03HDCtUPstx6EybkOi3O5Q==
Message-ID: <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
Date: Thu, 6 Nov 2025 10:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: ingenic:
 convert to set_phy_intf_sel()
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

Hi Russell,

On 06/11/2025 09:55, Russell King (Oracle) wrote:
> On Wed, Nov 05, 2025 at 01:25:54PM +0000, Russell King (Oracle) wrote:
> Convert ingenic to use the new ->set_phy_intf_sel() method that was
> recently introduced in net-next.
> 
> This is the largest of the conversions, as there is scope for cleanups
> along with the conversion.
> 
> v2: fix build warnings in patch 9 by rearranging the code
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
>  1 file changed, 45 insertions(+), 120 deletions(-)
> 

Damned, missed that V2 and started reviewing V1... I'll resend the tags
for V2.

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
