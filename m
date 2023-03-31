Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C156D2AE2
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 00:06:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CBB1C69069;
	Fri, 31 Mar 2023 22:06:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E4C9C6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680300378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4U8Z/tCC6KI1ZHcEPqkuT5mdoVjDaEr2xngNPO60lM=;
 b=evHOhfHuV9ymClX32BL75ijuDOchNT665K0fLJCM6NH6ygBitSKR6/uNxj2NqL9W9DCTie
 xzKXIX4HjWjY9V9GnvTem0xm2HdxilspeCEculUMKSs5oXjAckM8f/E99W9D9lFVXtRvyV
 HzbLGH3X2Qbc7VAwp/lwnRMjY1y5y1U=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-REjcPbJqNhKVB8OnY3KRYg-1; Fri, 31 Mar 2023 18:06:17 -0400
X-MC-Unique: REjcPbJqNhKVB8OnY3KRYg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1777653e2c4so11957624fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 15:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680300377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4U8Z/tCC6KI1ZHcEPqkuT5mdoVjDaEr2xngNPO60lM=;
 b=Af6gK0UrAuOr5MZUtHs8FJaPqMtXz2PDKl3pGS9RqdjSWaWQW8A2vX80Qdk53BH3fR
 Caourx5EWHUv7S9egkvzgxkIGTzuT6nwq1w9ayDFhT2nYR03OB6ZBH5foBTACd79IGZg
 Hcy8HPTjfkJZgCdnzs6QSscNbSPd5zpHrdHSzAdXvHWllT/bPjQyyRNm4WoVhMjaTSnK
 cxKBd1igmLoEP7zbJpJ9SvEAFC3h/MxCJy+9A5r2g+uCfySNQlaTazCXlBzWTfNWSwDa
 caDdUhwDhNCp7LU1EPv08QXFFZCx4QhnUnlDQu4Z8niLXhWjSF6F2FJhAHIgNZUrK0So
 4yFQ==
X-Gm-Message-State: AAQBX9cZmszCkLbA7KVVfT7jUrnIWIwiVt6rmgZSQ3wGhGiHVuTqhARJ
 LSe+UfUw0TY4NVFU9eiaHejgxj+a38vdKG882gkzPvanSBUVX2xPCX7/mwN1RGR7dEBe0b27Tq0
 B27VLOeeeHXW8LeqxzLbtyIaBhP9J/8ZFMom7wf6n
X-Received: by 2002:a05:6871:282:b0:172:80fd:8482 with SMTP id
 i2-20020a056871028200b0017280fd8482mr19329662oae.5.1680300376876; 
 Fri, 31 Mar 2023 15:06:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGGsF2laKAGdPP0P41FMsK9S+A2djDpOUWZkU3NZ+9W7d4GHZmrs+i2VfMoBvGhIEn0N/dew==
X-Received: by 2002:a05:6871:282:b0:172:80fd:8482 with SMTP id
 i2-20020a056871028200b0017280fd8482mr19329633oae.5.1680300376680; 
 Fri, 31 Mar 2023 15:06:16 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 h11-20020a9d798b000000b0069f74706056sm641395otm.9.2023.03.31.15.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 15:06:16 -0700 (PDT)
Date: Fri, 31 Mar 2023 17:06:13 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Message-ID: <20230331220613.2cr2r5mcf2wwse4j@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230331214549.756660-1-ahalaney@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] Add EMAC3 support for
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

On Fri, Mar 31, 2023 at 04:45:37PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for /dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 base platforms
> 
> This series makes the change for 1 above as well as other housekeeping items
> such as converting dt-bindings to yaml, etc.
> 
> As requested[1], it has been split up by compile time / maintainer tree.
> I will post a link to the associated devicetree changes that together
> with this series get the hardware functioning.

As promised: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#t

Thanks in advance for any reviews!
- Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
