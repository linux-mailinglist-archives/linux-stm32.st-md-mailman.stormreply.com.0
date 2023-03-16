Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 800666BD837
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 19:36:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A280C65043;
	Thu, 16 Mar 2023 18:36:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27596C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678991778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KyRYif1MrPgavn2zFlvhl2OTR1d8rOcAGT7lsOp4AaU=;
 b=KrOHD2s/HyEZa/PJ9XNhuXOwxjV2Zwad/YnWdx1NplzEPGIhrejA+7PMGapmvHJfa4ClPf
 vZq3HOgOE8aMGhklTTR/Rkghpxfce6MwUlkBokT2FHJSg1mmiHrqT9l3BgHRtHE22Xr/Pe
 R0ITtK91mIs/lLaQbZeRAf03UWCDWl8=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139--uZ4LZKcO2e3Wtz_VfZFTA-1; Thu, 16 Mar 2023 14:36:17 -0400
X-MC-Unique: -uZ4LZKcO2e3Wtz_VfZFTA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-17afa2c993cso813661fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 11:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678991776;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyRYif1MrPgavn2zFlvhl2OTR1d8rOcAGT7lsOp4AaU=;
 b=Xq/Vb/wVaCaiF5ELQcciSvhNPBBgASrt+ntNgrYJYaqcnIDgg7ibdprhtz3au8dZkW
 ZNNrxPMX8hcoXHyI11s7aDXdZLLPPaOr+HY87JGt+RoKXGlUKXiLLiW5UiqEesRKSWrG
 uCTUl5EPCFyjH8p2RUI2MvlBAA8oEsh8EU3Z38A1dHyjcy9ddOKbZ4i+RFpifjepXmuy
 4fjAF5XFEpUrqxZMiF1w8Zy7xI29pOz7QgfOuAAzlnSObh0Yu79gWgyXG/TbkOyRZ7A8
 Rchsx5/224KlmpPTVPFBxgujZ0jHLpKkM7bj5vF6mY+RoBXnKHVQtmMvSIHI/Ehz5vUs
 qzwg==
X-Gm-Message-State: AO0yUKWNpKQcGzNqGtLlFvAIfSqU96I+KfWlomKM/jh2CffO35aISQEs
 jexJwLJo/oxMdhlIZaIHo9tE9KaGTOOuMMxnVofBDMAZ5mm8+bBlo/goKc5jZmRJVFnUz8e0G6X
 m/ocyvHngLW7uSWKsoPCRQIaDST5SsegFPeSQW0nX
X-Received: by 2002:a54:481a:0:b0:383:ee1d:f489 with SMTP id
 j26-20020a54481a000000b00383ee1df489mr3780307oij.0.1678991776245; 
 Thu, 16 Mar 2023 11:36:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set+6u2IcSrwCQvmuCLBcaVgSXFJVKayRRTtTKp7bwyaSZEGBvWuzrI2bCwi60By8ACrUJ/gVmQ==
X-Received: by 2002:a54:481a:0:b0:383:ee1d:f489 with SMTP id
 j26-20020a54481a000000b00383ee1df489mr3780239oij.0.1678991774493; 
 Thu, 16 Mar 2023 11:36:14 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 x82-20020acae055000000b00369a721732asm24184oig.41.2023.03.16.11.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 11:36:13 -0700 (PDT)
Date: Thu, 16 Mar 2023 13:36:09 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230316183609.a3ymuku2cmhpyrpc@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-9-ahalaney@redhat.com>
 <20230313173904.3d611e83@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230313173904.3d611e83@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: Add EMAC3
	variant of dwmac4
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

On Mon, Mar 13, 2023 at 05:39:04PM -0700, Jakub Kicinski wrote:
> On Mon, 13 Mar 2023 11:56:17 -0500 Andrew Halaney wrote:
> > EMAC3 is a Qualcomm variant of dwmac4 that functions the same, but has a
> > different address space layout for MTL and DMA registers. This makes the
> > patch a bit more complicated than we would like so let's explain why the
> > current approach was used.
> 
> Please drop all the static inlines in C sources, you're wrapping 
> a single function call, the compiler will do the right thing.
> 
> Please no more than 6 function arguments.
> 

Thanks for the feedback! With respect to <= 6 function arguments, if I
counted right the only violation is this:

static void do_config_cbs(struct mac_device_info *hw, u32 send_slope,
			  u32 idle_slope, u32 high_credit, u32 low_credit,
			  u32 queue, u32 etsx_ctrl_base_addr,
			  u32 send_slp_credx_base_addr,
			  u32 high_credx_base_addr, u32 low_credx_base_addr,
			  void (*set_mtl_tx_queue_weight)(struct mac_device_info *hw,
							  u32 weight, u32 queue))
(...)
static void emac3_config_cbs(struct mac_device_info *hw, u32 send_slope,
				    u32 idle_slope, u32 high_credit,
				    u32 low_credit, u32 queue)

I agree, that's quite gnarly to read. the emac3_config_cbs is the
callback, so it's already at 6 arguments, so there's nothing I can
trim there. I could create some struct for readability, populate that,
then call the do_config_cbs() func with it from emac3_config_cbs.
Is that the sort of thing you want to see?

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
