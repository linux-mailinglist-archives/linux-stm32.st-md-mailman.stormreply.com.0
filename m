Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4482589DC2C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 16:26:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E771FC7128A;
	Tue,  9 Apr 2024 14:26:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A40DC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 14:26:18 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5171a529224so2694497e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712672778; x=1713277578;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5siHBidFUu/f/+SSwIYn7JsHrl83u4UHX8WsLfWFlHk=;
 b=WhJFtTxoFfFfClzs48fB+90ep7c83TGh2giP5s20z6qim8DSG2vjVBv7JhpABX8iJR
 PEA9qrc0mmk/EcHVG8mJyVdv8WmiwzbOw68qUHIY939X/r1eIlR5C+VBIj2ubzPwWqS9
 +JMgdaoTCPDr12cLN2P8Kv9L8RGtz3rpJc5v3zUleJchRGTje3JXk0z8vswOEC5Pmx4w
 UQElTlr8R/x7x1mOluUABH1bP4hTNFZL2nKFdWHeWF9OHqTSsLQIywgFPYQrH7T/hKkL
 Vv/9vgDwMjvuR6Z0olMsNNLvozkcpdZUwc46LRxDAtVUxx4fOkiR7593R3F/iV0zjn5U
 V49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712672778; x=1713277578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5siHBidFUu/f/+SSwIYn7JsHrl83u4UHX8WsLfWFlHk=;
 b=hWB9wWvRc8wa/OndIj1Qd/xCnQaLFO4mRb21Z2lkEDelwwzcfAPl6vFJ+KJACgmXnp
 ZFWwutF7v6XK7jhjdcG1OkJmJbRANIHYaEZWleumjPz1DX8guUtuoYZVLmcE+H4Ae1T4
 O8jTFsgBJven0FWJR3h77xTgf37MxW820dgQbu3ncA3dkGcLHDR00h97y7IVipHz0B6w
 ZAViXXIs/29nmCFXIZpirn7vWLZSquBMrrj8AjvLGWy2hS87crJAj4m4BS1l/pZeRZ41
 Hnl9dxJ6SJYZtHWX3FHzcESZKJNxIBu9GYtWBn4462lEfIkofCVnJLvk02K3PuAosTne
 Me5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7ncq/v5okm97octrn90nNG/chDMWVyQQ/Hjkcnh7KqaT5fcaInwEnT3jfc6c2AkRd7ykN4tGfXsukgMwqZSEcL6xyTHiyqI1l6gLeG1SNLZfNLZUxmo1y
X-Gm-Message-State: AOJu0Yy56aOcY325yhxB0lzdrHnCdhmyTaK9t432b0QRBdukQOWnQXaP
 UrkTdgk940IHWV4g+6L/YA+4UWNaH6DlzHXIHaWGLV9eEpNDl6iY
X-Google-Smtp-Source: AGHT+IHj+m5LwCmCOAmqAI1oRxRP3QiTiWCZAHVTOsuuo4TMQQOeU4/As9nnE1nRGMtnNgpgroibvA==
X-Received: by 2002:ac2:5337:0:b0:513:dac5:ee22 with SMTP id
 f23-20020ac25337000000b00513dac5ee22mr6953932lfh.28.1712672777495; 
 Tue, 09 Apr 2024 07:26:17 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a195e11000000b00515d55b66acsm1558748lfb.64.2024.04.09.07.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:26:17 -0700 (PDT)
Date: Tue, 9 Apr 2024 17:26:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <qfsmz4mtjknbul2e43mvqghinqvpqq3hsnp5p5prtpbmoa47at@g3zuvdq7kirx>
References: <20240408012943.66508-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408012943.66508-1-minda.chen@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add missing mmc statistics in DW
	GMAC
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

On Mon, Apr 08, 2024 at 09:29:41AM +0800, Minda Chen wrote:
> Add miss MMC statistic in DW GMAC
> 
> base on 6.9-rc1
> 
> changed
> v2:
>    patch2 : remove mmc_rx_control_g due to it is gotten in
> ethtool_ops::get_eth_ctrl_stats.

The series has already been merged in. Just a small note about the
patches. Both the changes seems reasonable:
LPI-statistics for DW GMAC and DW QoS Eth,
and
Rx-Recv and Tx-oversize errors stat for DW GMAC and DW QoS Eth.
The former stats has originally been added for DW XGMAC and the later
stats aren't supported by DW XGMAC. So the provided change is
complete. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Minda Chen (2):
>   net: stmmac: mmc_core: Add GMAC LPI statistics
>   net: stmmac: mmc_core: Add GMAC mmc tx/rx missing statistics
> 
>  drivers/net/ethernet/stmicro/stmmac/mmc.h         |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c    | 15 +++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 ++
>  3 files changed, 19 insertions(+)
> 
> 
> base-commit: 4cece764965020c22cff7665b18a012006359095
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
