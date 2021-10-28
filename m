Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522E43E673
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Oct 2021 18:44:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24669C5E2BA;
	Thu, 28 Oct 2021 16:44:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A61B1C5E2B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 16:44:42 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so5263745pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jSIfnI7MQAHzmYbWsa55tC1HPw8ddYjjYO0zKn+HJ8s=;
 b=ywUtE77eKqUVOePjgXz+r0KqYm7mtXBFy3cYHBMbed+RnvptTuh54lPXKIpoxULqoj
 ii9zyeMF4Vev0ewU33J3USJnKWMjUGyV1iIS5a4YL8YRbauaaWih5XZFU0z1xasrwUcg
 J/ogNZAqB+vRAD/JLE0eNxyDY9NWoKtyb03AfLDra0Asxw/49u0CfkNgz47gvVQNVCBZ
 mJLdoroh3KQrBJEqZ6ewVTDo3TyqnvowgBgWh84EYofvYJhdtkn0unmZ0cPVJcirwOoX
 SoeYo/F3NGSySBNA1bCqHqlrVWRJrnm7VIAodgGXqO1wKdmAo4C22piaxpbZHbG3Wh4y
 SgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jSIfnI7MQAHzmYbWsa55tC1HPw8ddYjjYO0zKn+HJ8s=;
 b=JFBflC2GmgEZEaFesbx9aG64jvMi7m1jJHdHgVutENWFlPkuaMmwaCJayH8J1Lf59B
 jihDusT+rof+9DSIw0eqLcSjDngoyueQN0weeiaoKqy2/VesY+S8rBsSxQ1mnJCqFwzW
 BO/T5w4FhaOH2b7boU7HaDDC9muvXt16P50D1lY28CVH1+Fh+IkjHFws5sWooxqF9bbG
 WcLMUDAhKinRfeaE1SUtyl/qkyzG3J44W7LZxgZe/10XFnv391lLJr8/cf90omJ1Z27h
 rQWcZZqg67795c7OWoIxdz9BzhlU49V/PiPz8jdAfG0KNjepRtrptXpGRhTJfTmytsiR
 J0Dg==
X-Gm-Message-State: AOAM533ou9psAoxX+nOm4vGjNreGKGhJSh+OVzV7l1J9x2qg0+ZJpflT
 3LW1oMAQpUmE1vrs5iViNaGi2w==
X-Google-Smtp-Source: ABdhPJx82C63B35ZWB+HVNntHTa/NJT3Hk+DKgJOMXkel40VGwu1VgN5Lw975JF9hobnf6bT22adMw==
X-Received: by 2002:a17:902:e789:b0:140:801:1262 with SMTP id
 cp9-20020a170902e78900b0014008011262mr4865442plb.42.1635439481231; 
 Thu, 28 Oct 2021 09:44:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g17sm3349474pfc.193.2021.10.28.09.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:44:39 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:44:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20211028164437.GA4045120@p14s>
References: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
 <663d3820f118c37a81529b3362b95e09c8e75e9f.camel@perches.com>
 <bb913ce7-bae6-3b3e-180f-946786f7d300@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb913ce7-bae6-3b3e-180f-946786f7d300@wanadoo.fr>
Cc: suzuki.poulose@arm.com, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, leo.yan@linaro.org, Joe Perches <joe@perches.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH] coresight: Use devm_bitmap_zalloc when
	applicable
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Good day,

On Sat, Oct 23, 2021 at 10:09:14PM +0200, Christophe JAILLET wrote:
> Le 23/10/2021 =E0 21:36, Joe Perches a =E9crit=A0:
> > On Sat, 2021-10-23 at 21:24 +0200, Christophe JAILLET wrote:
> > > 'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()'=
 to
> > > simplify code, improve the semantic and avoid some open-coded arithme=
tic
> > > in allocator arguments.
> > []
> > > diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hw=
tracing/coresight/coresight-stm.c
> > []
> > > @@ -862,7 +862,6 @@ static int stm_probe(struct amba_device *adev, co=
nst struct amba_id *id)
> > >   	struct stm_drvdata *drvdata;
> > >   	struct resource *res =3D &adev->res;
> > >   	struct resource ch_res;
> > > -	size_t bitmap_size;
> > >   	struct coresight_desc desc =3D { 0 };
> > >   	desc.name =3D coresight_alloc_device_name(&stm_devs, dev);
> > > @@ -904,9 +903,7 @@ static int stm_probe(struct amba_device *adev, co=
nst struct amba_id *id)
> > >   	else
> > >   		drvdata->numsp =3D stm_num_stimulus_port(drvdata);
> > > -	bitmap_size =3D BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
> > > -
> > > -	guaranteed =3D devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> > > +	guaranteed =3D devm_bitmap_zalloc(dev, drvdata->numsp, GFP_KERNEL);
> > >   	if (!guaranteed)
> > >   		return -ENOMEM;
> > >   	drvdata->chs.guaranteed =3D guaranteed;
> > =

> > guaranteed is also pretty useless
> > =

> =

> I agree, but removing it would make the line with devm_bitmap_zalloc() 86
> chars. This would not be consistent with the rest of the file and would
> (IMHO) require splitting.
> =

> Let see if the maintainer prefer saving one additional line of code, or
> keeping the logic in place.

I think we can get rid of @guaranteed and splitting is fine with me:

        drvdata->chs.guaranteed =3D devm_bitmap_zalloc(dev,
                                                     drvdata->numsp,
                                                     GFP_KERNEL);

Thanks,
Mathieu


> =

> CJ
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
