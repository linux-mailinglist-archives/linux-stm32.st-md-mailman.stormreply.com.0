Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14C6DE5FD
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC8FC65E4F;
	Tue, 11 Apr 2023 20:50:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3616DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681246202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FnJ89Jr7frkhLpQ5e8FVQom59cKoMcGSZpquVEiks/w=;
 b=YaXFJ05Wm0K+gIXa2FzYO+x2hCiP+LTGms+SDb7lLsU3ApJFPAsQQ85OBbmLFPCjfW/Rdt
 T5W8PPUxbr1tEJgcu9FrdknzxjUBCZ6WHipwAEuQqx74X1tseGne6+5yK5Se5eFFa1R3+k
 5S5Dy7yletVB2TTpolASnzliysPB3qE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-dWhIUsyXNbaTh4Tn2WEZ0w-1; Tue, 11 Apr 2023 16:50:01 -0400
X-MC-Unique: dWhIUsyXNbaTh4Tn2WEZ0w-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-18430ae1d46so5107734fac.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681246201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnJ89Jr7frkhLpQ5e8FVQom59cKoMcGSZpquVEiks/w=;
 b=oJTEUsMB2my4xoMU/c6SE1K5+oG9r05YY0UBTwn6zgaL9pCUEgp6m8na5QWalolXXq
 0INxwkZGPNfJPmI7RxFQBLmz1wrqKDfS4RuG5dHw72tALm478PFOl7kOC15XlsADL2MQ
 3+XFj/Nj2YLluQniEYKIx7x5g8UouMrPWQYZ0mK28iK1mpJjdAOv2ug/mux1uaU6Qkf3
 qU8qa1emR2GCTNxXma9GJyLUMzor37YfMZ4gIMMDLeOGA/TL1Lp88rKUdEUR/MHDnq4s
 nvA2EvT+/kvMlyGwb3ZM9DRzYM7cg74yFXFmUdIbcz3Qo3QhyPbe8+r9vDfY57VO2LPI
 367A==
X-Gm-Message-State: AAQBX9dC9Kma6BrsqoJA8zMC+XdKdDVJDh6ZenWNQPsjHbkqMsxcK+Kv
 AM9FqMFLPinZ2aWd8orB8iPo7+iy5Fxcs6lOJTTOtMinJyoExcs/ju41mxPrl7sCp/aj/zKKiJU
 eUktI3e+QOsZ4bvwJHIgqCwVDERC71HAhBrHxPyzI
X-Received: by 2002:a05:6870:32c9:b0:17f:6909:1618 with SMTP id
 r9-20020a05687032c900b0017f69091618mr8385055oac.5.1681246201168; 
 Tue, 11 Apr 2023 13:50:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/jKcTh3Dg+IN29kMyFBcT98jFq7QbmEt+C4YJeNTF6M0ET6Rq1bJC/j+OEgYr3vcjHqKpaA==
X-Received: by 2002:a05:6870:32c9:b0:17f:6909:1618 with SMTP id
 r9-20020a05687032c900b0017f69091618mr8385021oac.5.1681246200922; 
 Tue, 11 Apr 2023 13:50:00 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 s21-20020a056830149500b006a3e377f0d7sm499957otq.4.2023.04.11.13.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:50:00 -0700 (PDT)
Date: Tue, 11 Apr 2023 15:49:57 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Message-ID: <20230411204957.kt5o4oraoxi7szts@halaney-x13s>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 00/12] Add EMAC3 support for
	sa8540p-ride
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

On Tue, Apr 11, 2023 at 03:03:57PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 based platforms
> 
> This series makes the changes above as well as other housekeeping items
> such as converting dt-bindings to yaml, etc.
> 
> As requested[1], it has been split up by compilation deps / maintainer tree.
> I will post a link to the associated devicetree changes that together
> with this series get the hardware functioning.
> 

Link to the devicetree bits: https://lore.kernel.org/netdev/20230411202009.460650-1-ahalaney@redhat.com/T/#t

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
