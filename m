Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B856C3DA2
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 23:20:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67FC1C65049;
	Tue, 21 Mar 2023 22:20:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E0BC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679437204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3d30Yo9IkuDAuQ71lplDlZlFi1tH3/S4QrO8CaL0yaU=;
 b=ZtiEf4t8MUqzHpuzHeZ+bOwGam9Wxo2Js5CYJlO4XyhWpY0qiPe7lgHO0lt9GcWIJ3QUaE
 v/+SWBAP/WjwYQ2iv/5RVPe5mJGab/pFW7pPd3BNgm5eep8dcJUAWqGPsZGTMALQsIE2iQ
 rHdZrZwbM4gaVysIKCDnPhcyCg3x1vs=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-GAk0QLxANZqh0ywrOWeA2g-1; Tue, 21 Mar 2023 18:20:03 -0400
X-MC-Unique: GAk0QLxANZqh0ywrOWeA2g-1
Received: by mail-oo1-f71.google.com with SMTP id
 z133-20020a4a498b000000b0053b5c4e33c5so1020908ooa.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 15:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679437203;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3d30Yo9IkuDAuQ71lplDlZlFi1tH3/S4QrO8CaL0yaU=;
 b=yxRfw5jSEkg/tH4bfIVHNQNh0o4NJLNcU6U0NhEr5lVMMwoqK7dcQP1jxiWaFDwDmN
 lBVrCEwAYSVaJrKdCB70Gul8Vdrl8S1jZLMwuWhPrcye9TSLchSV59l6tvpC1dUL22dO
 OBM+dSD3st2kWnL0JUBisMDWBgUeEI6OJLgZleJNudMB3rZHmbaJ4LtH0UVoCVuZYQUH
 EWUWQDZSGRIFm5leSEjYXD1c92Hv7/fhhrOOxEmNtYcQZyRk8mnLfL+7jh01apgsJAge
 SFEOEqsYlrhFwWaQN4zzAKIILM5CrsYcEozTnVaQKnBsUSfNZ6kRUvb8eQoAiJE1tClD
 AJBg==
X-Gm-Message-State: AO0yUKWlnVmkyoPymUxCHTGFC157NcIrl9Ztky/nNPKfeRz33s8EC8+E
 l1Y5dBi2cC18W3lYTJMuMVtc1woLXXWVuvF5MkNEve6Cvsykm4gOzVB5bvho1EOL3l7CheUSHvU
 c48hx9ktJMlZKyZRHw2/TrZYz4Yke+p7rK16xjb8w
X-Received: by 2002:a05:6870:461c:b0:17a:cabc:c92c with SMTP id
 z28-20020a056870461c00b0017acabcc92cmr389505oao.4.1679437202782; 
 Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set+U0ekkEh5oox/1FTDAwz5G/lXb0i1Zm4idONxXrNRjXje54uB3CMGHl647zfImhCphOO1Nqw==
X-Received: by 2002:a05:6870:461c:b0:17a:cabc:c92c with SMTP id
 z28-20020a056870461c00b0017acabcc92cmr389491oao.4.1679437202547; 
 Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 x5-20020a9d6285000000b0069d4e5284fdsm5566268otk.7.2023.03.21.15.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:19:58 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230321221958.e3s7mbpxp5hpm7su@halaney-x13s>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-10-ahalaney@redhat.com>
 <20230320204153.21736840@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230320204153.21736840@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/12] net: stmmac: Add EMAC3
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

On Mon, Mar 20, 2023 at 08:41:53PM -0700, Jakub Kicinski wrote:
> On Mon, 20 Mar 2023 17:16:14 -0500 Andrew Halaney wrote:
> > The next approach that was checked was to have a function pointer
> > embedded inside a structure that does the appropriate conversion based
> > on the variant that's in use. However, some of the function definitions
> > are like the following:
> > 
> >     void emac3_set_rx_ring_len(void __iomem *ioaddr, u32 len, u32 chan)
> 
> I checked a couple of callbacks and they seem to all be called with
> priv->iomem as an arg, so there is no strong reason to pass iomem
> instead of priv / hw. Or at least not to pass both..
> 
> I think that's a better approach than adding the wrappers :(
> 
> Are you familiar with coccinelle / spatch? It's often better than 
> just regexps for refactoring, maybe it can help?
> 

No worries, I'll try and refactor as you mentioned. Looking at it some
this afternoon makes me think I'll try something like this:

    diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
    index 16a7421715cb..75c55f696c7a 100644
    --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
    +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
    @@ -12,7 +12,7 @@
     ({ \
            int __result = -EINVAL; \
            if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) { \
    -               (__priv)->hw->__module->__cname((__arg0), ##__args); \
    +               (__priv)->hw->__module->__cname((__priv), (__arg0), ##__args); \
                    __result = 0; \
            } \
            __result; \
    @@ -21,7 +21,7 @@
     ({ \
            int __result = -EINVAL; \
            if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) \
    -               __result = (__priv)->hw->__module->__cname((__arg0), ##__args); \
    +               __result = (__priv)->hw->__module->__cname((__priv), (__arg0), ##__args); \
            __result; \
     })
     
    @@ -34,68 +34,68 @@ struct dma_edesc;
     /* Descriptors helpers */
     struct stmmac_desc_ops {
            /* DMA RX descriptor ring initialization */
    -       void (*init_rx_desc)(struct dma_desc *p, int disable_rx_ic, int mode,
    -                       int end, int bfsize);
    +       void (*init_rx_desc)(struct stmmac_priv *priv, struct dma_desc *p,
    +                            int disable_rx_ic, int mode, int end, int bfsize);
            /* DMA TX descriptor ring initialization */
    (...)

and then, I'll add something like:

    diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
    index a152678b82b7..f5f406a09ae3 100644
    --- a/include/linux/stmmac.h
    +++ b/include/linux/stmmac.h
    @@ -273,5 +273,7 @@ struct plat_stmmacenet_data {
            bool use_phy_wol;
            bool sph_disable;
            bool serdes_up_after_phy_linkup;
    +       u32 mtl_base;
    +       u32 mtl_offset;
     };
     #endif

and rewrite:

    #define MTL_CHANX_BASE_ADDR(x)		(MTL_CHAN_BASE_ADDR + \
                                            (x * MTL_CHAN_BASE_OFFSET))

to use mtl_base/offset if they exist, and so on for the DMA versions,
etc...

I'm sure I'll probably run into some issue and change course slightly,
but thought I'd post a hint of the path to make sure I'm not way off the
mark.

Thanks for your feedback,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
