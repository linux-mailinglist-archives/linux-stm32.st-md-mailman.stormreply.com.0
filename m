Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D95465954
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 23:34:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E98A6C5A4F8;
	Wed,  1 Dec 2021 22:34:57 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BED88C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 22:34:56 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id bj13so51690965oib.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Dec 2021 14:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1cxGpGuXFYT7z9IMgpvEZhppfpCtenqGacj+Q88IAEE=;
 b=X0qxiC+XWbYDDFRRhVlZh7DvNAmRUrJ5BFh8IzhGQ1zI2fqyFjaYqSM62SI1TQaD0D
 FHpoj1iSa14MF4DXiblF6wj8WUrDu2q5iYLwPzrfXstd2pRjy1k6z8PkO46FrckmFBam
 6GsTjuX3UezXpqdDNvi1O60j1R+VH5100sf9kx3RTtBPbqjlQHbxCXJAevFg/NGCFeyg
 4qZWtU8JGMZhXMKZri8wAtephF0kVL99s+xVAohGR/+JYxAFc+koatZopOnlXRgh4WSV
 T1rb8NWXgaDNe7/XVm1n1z1vfy9qI6a6AYx/00FyNKaP8MpdgwusEJJDFjk+2uNf9raN
 S6hQ==
X-Gm-Message-State: AOAM533FNX82QjE1KQvro9gLfRNLZx2vdsMLoWEoPmagBqOmALyrOuCw
 PFzhYl2Bsm2gsmMxodK9Jg==
X-Google-Smtp-Source: ABdhPJzYVbv04PWEmrUTCr7W5O/7iNRMV3i5k8Bm9QEVICIoEC+6CgArt/iFDuAT12MH7ix6AtarcQ==
X-Received: by 2002:aca:d608:: with SMTP id n8mr1145835oig.89.1638398095643;
 Wed, 01 Dec 2021 14:34:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf17sm655019oib.27.2021.12.01.14.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:34:55 -0800 (PST)
Received: (nullmailer pid 2914345 invoked by uid 1000);
 Wed, 01 Dec 2021 22:34:54 -0000
Date: Wed, 1 Dec 2021 16:34:54 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
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

On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
> Hi Rob,
> 
> On 11/25/21 10:26 PM, Rob Herring wrote:
> > On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
> > > The STM2 I2S DAI can be connected via the audio-graph-card.
> > > Add port entry into the bindings.
> > > 
> > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > > ---
> > >   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: https://patchwork.ozlabs.org/patch/1559750
> > 
> > 
> > audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
> > 	arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
> > 	arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
> > 
> 
> This warning is not a new one.
> 
> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
> port:
> 	$ref: audio-graph-port.yaml#
> 	unevaluatedProperties: false
> 
> However the spi binding requires to introduce a unit address:
> patternProperties:
>   '^port@[0-9]':
>     $ref: audio-graph-port.yaml#
>     unevaluatedProperties: false
> 
> The warning can be removed by re-ordering the bindings patches in the serie,
> as "additionalProperties: true" makes the check more tolerant on extra
> properties.

That's never right.

> The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
> even be merely dropped.
> So, I suggest to resend the serie without audio-graph-card patch.

Only if you aren't using audio-graph-card.

> 
> Does it sound too permissive to you ?

I think perhaps you need to combine the schemas into 1. Or you need to 
restructure your dtsi files such that you only add spi specific 
properties when spi mode is enabled and only add i2s specific properties 
when i2s mode is enabled. Or use the /delete-property/ directive.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
