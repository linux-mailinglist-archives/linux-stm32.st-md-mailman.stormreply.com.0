Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B147D6A0580
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 10:59:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6049DC6A5F8;
	Thu, 23 Feb 2023 09:59:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 000BBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 09:59:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id fd25so4996909pfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KyRK91vg0j88IuIhLZ0aJ8iKiCeZSnGjPamguHgqjw8=;
 b=b9rEiW9KMUJqREjXrJ8GuCRoBj6M4Kd8mvGydAldZ3Y4t1ks8fAM6PGOLftbqd2jnB
 dZsvkq3TFSRBS52p4V3a1z6utc3hrfgeHMgyIig4Ygo5A7hmMnVleDb2uXGePzhxhao7
 eFrqaZ9sm9wbGMCsqCQMwOArgHsasXKU4r8ykIGYL2afsVVG63F9f4T5LpVC7cTau0fU
 G7rJqSe0hcdGlMqRTAUOP90GztkUNLo1nD4qN+NEpoShAiQlNklRbH13ySuOHOJl4Hrz
 +MfU5aFXEvdrJ44wZMNtr7OGHcgJ4NMx5Xo/qEFjlp9fNMgbNtQJtuWZfTDDWC30L2Nr
 O9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KyRK91vg0j88IuIhLZ0aJ8iKiCeZSnGjPamguHgqjw8=;
 b=YZRk5Yvzeg24r+Od5Q1hlLBuaCWGhcR6sda9Mhui/ChMcoAE/oR76kRO5071df2JpR
 zH3pYHN0Cz7B3yft7HSlQw5C7SkfH+3mxtF1p0s1BiuNlNhbHdvjJEE8lZlN36hqokSa
 RuRFo7qof+mnh1OeYCaBGNRWucvLXHjWy69XGBEwDMNOHjsiKLPIPUV9ASOGionvDGaR
 SxIZZcCal/lofug8FN3GrAybbF+mi34nX/9uStDi1jxYiaeY0Fpr6nFw9jqD6gigto2W
 FrsWrzDDkFlyqhHUywc4l47Y/uHFs7e3W2ceW/FARfJ/peborPA3QmPqf2Gv9O5q+XSW
 Khag==
X-Gm-Message-State: AO0yUKVf21Hqm69CqFEdVBE96k4NWT6Uxycj9mBEA7ynYsHcz1qBbi3D
 rCENJ47MUE6N6RUFu9Rm6+/cKAN/xcj72LVxOXXYqw==
X-Google-Smtp-Source: AK7set9/J2Be/4CV79fOALPqbEJN+Xm0wRxAIa1O/onWAy2C3fe+0mPP4lKHhPsAm7w9jW+Jk8gV+thCVnU9R+EFnnE=
X-Received: by 2002:a63:334d:0:b0:4fb:ba81:7143 with SMTP id
 z74-20020a63334d000000b004fbba817143mr1624088pgz.0.1677146393283; Thu, 23 Feb
 2023 01:59:53 -0800 (PST)
MIME-Version: 1.0
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
 <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
In-Reply-To: <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 23 Feb 2023 09:59:41 +0000
Message-ID: <CAJ9a7VhS1qPzo79z4aPXnDHG6SheX7Kk4GogOyFvy3XN3_Ms5g@mail.gmail.com>
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Coresight ML <coresight@lists.linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

Hi,

On Thu, 23 Feb 2023 at 06:41, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
> On 2/22/2023 8:19 PM, Mike Leach wrote:
> > Hi
> >
> > A couple additional points...
> >
> > On Wed, 22 Feb 2023 at 11:00, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >> On 21/02/2023 06:53, Jinlong Mao wrote:
> >>> Hi all,
> >>>
> >>> When there is some small packet sent from STM to ETR, the small packet
> >>> could be stuck between source
> >>> and sink even if manual flush is set when disable ETR.
> >> Why ? The manual flush should trigger a flush request upstream
> >> and eventually cause a flush ? If this doesn't work as expected
> >> we should try to get to the bottom of that first, before jumping
> >> into "software work arounds".
> >>
> >>> So there is requirement that flush the STM trace periodically after
> >>> enabling STM to ETR.
> >>>
> >>> STM can generate TRIG_TS packet by writing to offset 0xF0 of the driver
> >>> STM stimulus port.
> >>> ETR has ability to initiate a flush on seeing a TRIG_TS packet.
> >> Why is this different from the "manual flush" and how does it help ?
> >> Is it because one of the components doesn't respond properly to the
> >> flush request ?
> >>
> >>
> >> Kind regards
> >> Suzuki
> >>
> >>> For this requirement, I want to create a sysfs node like trig_ts for STM.
> >>> When writing 1 to this sysfs node, a timer with 1 second periodicity in
> >>> STM will start to generate the trig_ts packet to ETR.
> > If this is really needed, then the source writing the data you wish to
> > flush should write to the relevant STM stimulus port. There is no
> > justification for a polling mechanism when the client itself can do
> > the write at a  time you believe it to be needed.
> >
> >>> Once ETR receive the TRIG_TS packet, it will initiate a flush.
> > The ETR does not interpret STM packets - this alone will not initiate a flush.
> >
> > It is possible to program the ETR to respond to the FLUSHIN or TRIGIN
> > signals via the ECT/CTI network of signals, or a trigger event in the
> > trace stream (ATID=0x7D) if a source (in this case the STM) is
> > programmed to output these specific packets when it generates trigger
> > packets in its own protocol.
> > Programming bits in the FFCR control these operations, STM must be
> > programmed separately to generate appropriate output responses on
> > trigger packets.
> >
> > Regards
> >
> > Mike
>
> Hi Suzuki & Mike,
>
> There is USB case support in our internal device.
> Data path is that  STM data ---> ETR -----> USB ----> PC tool.
>
> On PC tool, it can show the logs from ETR in real time.
>
> When one small packet send from STM to ETR, it can be stuck between STM
> and ETR.
> When the packet stuck happens, it will be flushed to ETR only when some
> other packets
> generated from STM source or CTI flush commands are sent. If the time is
> too long to wait
> for next packets coming, user will consider that issue happens with
> previous small packet.
> And user's requirement is that packet from STM can be flushed to ETR
> automatically instead
> of sending commands manually.
>
> Is it appropriate to add a sysfs node for STM to generate the trigger
> packet periodically for such case ?
>

It is likely that the small amount of data is not sufficient to fill a
16byte packet in the ETR formatter, therefore is not being output.
Therefore when you do add more data, or initiate a flush then this
data will then be output - possibly with padding to complete the
formatter frame.

As mentioned before, it should be sufficient to program the ETR to
flush on trig in, the STM to emit a trigger packet into the ATB stream
when protocol packets such as TRIG_TS is written, and use the STM
client that is writing the data to write to the TRIG_TS offset when
data needs flushing. This is no different than flushing any standard
iostream.

A periodic write should not be needed.

Regards

Mike


>
> Thanks
> Jinlong Mao
>
>
> >
> >>> Could you please help to provide your comments on this requirement ?
> >>>
> >>> Thanks
> >>> Jinlong Mao
> >>>
> >


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
