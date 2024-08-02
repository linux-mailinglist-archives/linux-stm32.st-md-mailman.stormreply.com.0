Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B24946394
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 21:12:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBC8BC7129D;
	Fri,  2 Aug 2024 19:12:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693BDC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722625934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeHceffG2DvzwnKMzj0FH08E1flGznXu0RYbhG1MEgM=;
 b=E5yu08UVB7OT2cwdVFBkd3KhwDFmSjLLBZUUa6X5ql5VegAFGu1YyrqNcMoyu64h7BKPLy
 NjYoat68LRKYBplIO9JOfyPPZGwWvr8TVtWHgKzvXJ27pbmSbKStML/rZaOLipw50DiM6Z
 HX8Fgnd1h2547KoSk2jcOvGMlkwst3s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-kDDijesEMn-Uc12IasATiw-1; Fri, 02 Aug 2024 15:12:13 -0400
X-MC-Unique: kDDijesEMn-Uc12IasATiw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6b79810e326so111696646d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 12:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722625932; x=1723230732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MeHceffG2DvzwnKMzj0FH08E1flGznXu0RYbhG1MEgM=;
 b=HkVqnmQVE3tfQxOeeRF9S8HX7VmsmKkOrG2yDgYoRaHO7EbtVZhcA/oyXQT+bDlQV+
 KZvOB1Kq7iIP2xMSCQBZNNmheLnPXTXj2JM8xSCojQk2hbw3qNhPSe9crdTlLqWClMS9
 PJMIM177ZbHChRRRvekdROqM7AaowCiwi0GPcVkc5M/Gjp0mPA14pcNr9AROSZ8W/kCb
 yl33Ud7+Av900/HRymUYwS+Yy1quEfYZ8SGqUWEfGCRIFlG2yV9tsiTMBpSHTLNlbbZU
 kzctAtjhhKrpPcl63ivP2uI+v7EVFpP6/U4tioKII5F31ldIe5A4W5ruoBLX3xjVDkJQ
 qbZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2NSxUP4lPS1KgPJIwrftCm6VK0CKhCaqegvNOBsj7diQSUhMML09kX8TgIXc1MM8zGuK+YHq7UrWtfNHqcjbKJVi4sm+RYb0do/3NGWpwWfcu4WkgbMzs
X-Gm-Message-State: AOJu0YzI0NBumo38iWJS8+IYfmiroliWdwwW9vTjOaAzkYR2nWGVb/Yf
 LYC06pqTnVppFcJX+Ket6e3/HgUGE/3FEf1bW51FzdcMF0uXM4zLiqz4RXEXNb2tRVjxjWfoiAK
 rqH6HznhN9jb7Yo4WYnS0BETGHv3wJsWuCUrDEakkoTsbOhMaaq41ofLlknjMVhRNwT4bvBmD8r
 HZ3w==
X-Received: by 2002:a05:6214:419e:b0:6b7:a4dc:e24a with SMTP id
 6a1803df08f44-6bb984c2dc5mr45628476d6.54.1722625932545; 
 Fri, 02 Aug 2024 12:12:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRfbbC2Grol7Hz6dSqVP5HlRsLd1BHxqCCywxSF3I2nLeCO3jas/mUewssAd0BLE0wzgqG8Q==
X-Received: by 2002:a05:6214:419e:b0:6b7:a4dc:e24a with SMTP id
 6a1803df08f44-6bb984c2dc5mr45628146d6.54.1722625932128; 
 Fri, 02 Aug 2024 12:12:12 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c76aceasm9638566d6.6.2024.08.02.12.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:12:11 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:12:08 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Message-ID: <yma4bknen5jc6om56eorr44uuoqtziqvk4phds6cpkrubrs5dy@esxfxtz22egh>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpov-000eI5-KP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpov-000eI5-KP@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 14/14] net: stmmac: Activate
 Inband/PCS flag based on the selected iface
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

On Fri, Aug 02, 2024 at 11:47:37AM GMT, Russell King wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
> into the DW GMAC controller. It's always done if the controller supports
> at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
> interfaces support was activated during the IP-core synthesize the PCS
> block won't be activated either and the HWFEATURE.PCSSEL flag won't be
> set. Based on that the RGMII in-band status detection procedure
> implemented in the driver hasn't been working for the devices with the
> RGMII interface support and with none of the SGMII, TBI, RTBI PHY
> interfaces available in the device.
> 
> Fix that just by dropping the dma_cap.pcs flag check from the conditional
> statement responsible for the In-band/PCS functionality activation. If the
> RGMII interface is supported by the device then the in-band link status
> detection will be also supported automatically (it's always embedded into
> the RGMII RTL code). If the SGMII interface is supported by the device
> then the PCS block will be supported too (it's unconditionally synthesized
> into the controller). The later is also correct for the TBI/RTBI PHY
> interfaces.
> 
> Note while at it drop the netdev_dbg() calls since at the moment of the
> stmmac_check_pcs_mode() invocation the network device isn't registered. So
> the debug prints will be for the unknown/NULL device.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> [rmk: fix build errors, only use PCS for SGMII if priv->dma_cap.pcs is set]
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Russell, did you add in the priv->dma_cap.pcs check with SGMII just
because it *is* expected to be set unconditionally when SGMII support is
there?

Always fan of less conditionals, so just curious as to your motivation
since Serge's message makes it seem like SGMII && dma_cap.pcs is a
redundant check.

Otherwise, looks good to me.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
