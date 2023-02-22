Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BF69F464
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 13:20:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F9E3C6A5FC;
	Wed, 22 Feb 2023 12:20:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6E7C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 12:20:09 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so8179186pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 04:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z2Nnpf93XmA+udB7a4KC2NBdCbP7kHMS5xpUWswLdGY=;
 b=dcD5CjuT9FgW4GtzAvv9ve50cxlH2XC67QBMPUnlONVUA7kjr7M9vdB594PHdeKGoq
 Q3VutmvXH92ODMDWrIz/FtN2VhNJb6hEnDkGU7lSR/JzyCeq4DrVWFdiOnZUQpOgblRP
 +0B4hcLJmCH6+iWKcC2pMIAxjB3SFl4ARd5K8Lv/bs3FUDqT89IkxCWrrX7C6LEsr9Mm
 NhN9u8gu+bSGzjs+9QSAaEzk/J6UsFO3R0kqKyrHonRgrLaLI7AFk5fTOj/KshcDKMwk
 9TDX3VxuqEnSUyzdPQhJsb2g74+OQ6hyDw3yDQoOJwvBZDfNMfTzv6ouRlaZ0UwwOh1E
 9sYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z2Nnpf93XmA+udB7a4KC2NBdCbP7kHMS5xpUWswLdGY=;
 b=7UHmAf0hat4qctLIOWG6RchAtrl/ZqT95m1DPjFiSGCpZcUiGiymxNmmA4nkTOzion
 mKAAR75spedz/3aF13hu0aZDN1wUtAQoXZiqJ064hqBPmd3cU8oJR3SKnMG0/hYa123D
 jMisXWSVKNfA0Zi/0MqL3uguG+hjxF2fEzYmR50sfNFZPy9roJUr/CvzW3xEcHsqfHRe
 F4vMkej5odlgLR5+QGaOu7vGpf+CAxtt55rsiL4kTty7CrKm+MHE8DMBjDdD+1GjkJoh
 4sBIZX39UzM+x9/zIXjSvu54P0vxnwZUjftGXWECIyFaXwFuxmFF9jjFdxvj80fpMOvX
 ROaw==
X-Gm-Message-State: AO0yUKUFDGCo5OM3fizPADkWwKUba3Djkfo6dfNWNYVS0KEm12si9GHA
 VbvD68IAXX82joL9t4N5ZgsdzPyecxtwKFovGLwtiA==
X-Google-Smtp-Source: AK7set+1ERyfv6CMNdI/yH6AWXxrIALiNUcElqJtE72mE1V7qCn2vY9qrxaMmw+KwF6wO31eyKpV7vFonQDZX3qIGiA=
X-Received: by 2002:a17:90b:2704:b0:237:28e3:4f06 with SMTP id
 px4-20020a17090b270400b0023728e34f06mr1087860pjb.62.1677068408231; Wed, 22
 Feb 2023 04:20:08 -0800 (PST)
MIME-Version: 1.0
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
In-Reply-To: <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 22 Feb 2023 12:19:56 +0000
Message-ID: <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Coresight ML <coresight@lists.linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
	TRIG_TS packet periodically
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

Hi

A couple additional points...

On Wed, 22 Feb 2023 at 11:00, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 21/02/2023 06:53, Jinlong Mao wrote:
> > Hi all,
> >
> > When there is some small packet sent from STM to ETR, the small packet
> > could be stuck between source
> > and sink even if manual flush is set when disable ETR.
>
> Why ? The manual flush should trigger a flush request upstream
> and eventually cause a flush ? If this doesn't work as expected
> we should try to get to the bottom of that first, before jumping
> into "software work arounds".
>
> > So there is requirement that flush the STM trace periodically after
> > enabling STM to ETR.
> >
> > STM can generate TRIG_TS packet by writing to offset 0xF0 of the driver
> > STM stimulus port.
> > ETR has ability to initiate a flush on seeing a TRIG_TS packet.
>
> Why is this different from the "manual flush" and how does it help ?
> Is it because one of the components doesn't respond properly to the
> flush request ?
>
>
> Kind regards
> Suzuki
>
> >
> > For this requirement, I want to create a sysfs node like trig_ts for STM.
> > When writing 1 to this sysfs node, a timer with 1 second periodicity in
> > STM will start to generate the trig_ts packet to ETR.

If this is really needed, then the source writing the data you wish to
flush should write to the relevant STM stimulus port. There is no
justification for a polling mechanism when the client itself can do
the write at a  time you believe it to be needed.

> > Once ETR receive the TRIG_TS packet, it will initiate a flush.

The ETR does not interpret STM packets - this alone will not initiate a flush.

It is possible to program the ETR to respond to the FLUSHIN or TRIGIN
signals via the ECT/CTI network of signals, or a trigger event in the
trace stream (ATID=0x7D) if a source (in this case the STM) is
programmed to output these specific packets when it generates trigger
packets in its own protocol.
Programming bits in the FFCR control these operations, STM must be
programmed separately to generate appropriate output responses on
trigger packets.

Regards

Mike

> >
> > Could you please help to provide your comments on this requirement ?
> >
> > Thanks
> > Jinlong Mao
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
