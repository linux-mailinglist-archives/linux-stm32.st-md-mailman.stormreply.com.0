Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB461B013E
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 07:57:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03D8FC36B0C;
	Mon, 20 Apr 2020 05:57:28 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA342C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 05:57:25 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id kb16so4104558pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2020 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XOlYkW/8hIDyB8VhMd7iCQpxoA6ZLYFkm9KhScpGO1k=;
 b=gbcpG0/49M1IDeB5++xI6+56FJK32zdttZi30hnGPyU25rr/bWEFdT94Z6yncL6veO
 7WI8HxA5DDsukMkqiyitufF84unLtVQoDdRfy5dyPOxqMH90gLFav3vkSd5uSFodI2BG
 fDiYFDsgyTG+WttIRKelT7RLgljHr3c0jPsjlaiMhFzb9er/ywYSbtVln8bO+flPb0xE
 CHxoZ6XmbxK3Jn6JH4eXTQC9ASCvaqp9TSLFEt5Hh+04d1p5I9ipTo2ebJ+weQAeNSUd
 QwbPlNxes1wukkhrlGs0O5YTrAuk3XplKr9RMgL+Hi3+rlXdIC3j/0fFc2wNK3dnM3sO
 INLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XOlYkW/8hIDyB8VhMd7iCQpxoA6ZLYFkm9KhScpGO1k=;
 b=ODAkbO3+mf4ko2Ae5Q4GEQ/IRU5WNv8DuimCjUUmRNrycW3o3HqcRRTAKQqLWGOPit
 m0OofmIlMpx+/XflXZiKLengV8p8yRyuJqod/0JOoxYWvpOlOU/OTQsTikOZfcryTUzU
 U2+e+Fgxx0UhReRonfA+sh40v7e7SnU+ZRGLlG7MC0cKSU6JrQcJJZoYciaMDCfmmMJe
 fcsDrqgPM8IwFZAC2int6hsx9f3CXC3uXUpaYHAyQAQ6CdLkkf8VD+Ug6uHAXMu2M8ZT
 eBfsJZfj3ITpS/tyRyzvpVKzwEFF5WByjTksyJcyCUsJblkLpu+9t7fiSdZEHMtNWrSo
 FPtA==
X-Gm-Message-State: AGi0PuY/mTumpO8JpTlfwvw9TETPLD7CT+k38HM6212DadrSJJMiLrDU
 WUMTjuLy2PjqTvEcKXRSCADMsA==
X-Google-Smtp-Source: APiQypJJsaRN2kwVAWfx+urkiVcYHFeQEbTr+tg1MzwPgOuM7o6/+A+5Vc3B1FZYuBizG6nS4DfUrg==
X-Received: by 2002:a17:902:8ec7:: with SMTP id
 x7mr15277533plo.3.1587362244158; 
 Sun, 19 Apr 2020 22:57:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 202sm56836pgf.41.2020.04.19.22.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 22:57:23 -0700 (PDT)
Date: Sun, 19 Apr 2020 22:57:46 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Cl?ment Leger <cleger@kalrayinc.com>
Message-ID: <20200420055746.GJ1516868@builder.lan>
References: <20200410102433.2672-1-cleger@kalray.eu>
 <20200410102433.2672-2-cleger@kalray.eu>
 <20200417193837.GB6797@xps15>
 <1280711269.16158926.1587152627279.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1280711269.16158926.1587152627279.JavaMail.zimbra@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] remoteproc: add
	rproc_coredump_set_elf_info
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

On Fri 17 Apr 12:43 PDT 2020, Cl?ment Leger wrote:

> ----- On 17 Apr, 2020, at 21:38, Mathieu Poirier mathieu.poirier@linaro.o=
rg wrote:
> =

> > On Fri, Apr 10, 2020 at 12:24:32PM +0200, Clement Leger wrote:
> >> This function allows drivers to correctly setup the coredump output
> >> elf information.
> >> =

> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
> >>  drivers/remoteproc/remoteproc_elf_loader.c |  3 --
> >>  include/linux/remoteproc.h                 |  2 ++
> >>  3 files changed, 32 insertions(+), 5 deletions(-)
> >> =

> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index a9ac1d01e09b..382443bab583 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1562,6 +1562,28 @@ int rproc_coredump_add_custom_segment(struct rp=
roc
> >> *rproc,
> >>  }
> >>  EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
> >>  =

> >> +/**
> >> + * rproc_coredump_set_elf_info() - set coredump elf information
> >> + * @rproc:	handle of a remote processor
> >> + * @class:	elf class for coredump elf file
> >> + * @size:	elf machine for coredump elf file
> =

> I just noticed that there is a typo, this should be "machine" and not "si=
ze".
> Let me know if you'll fix it when applying.
> =


Thanks for noticing, I fixed this up and applied the two patches.

Thanks,
Bjorn

> Thanks,
> =

> Cl=E9ment
> =

> >> + *
> >> + * Set elf information which will be used for coredump elf file.
> >> + *
> >> + * Return: 0 on success, negative errno on error.
> >> + */
> >> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 ma=
chine)
> >> +{
> >> +	if (class !=3D ELFCLASS64 && class !=3D ELFCLASS32)
> >> +		return -EINVAL;
> >> +
> >> +	rproc->elf_class =3D class;
> >> +	rproc->elf_machine =3D machine;
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(rproc_coredump_set_elf_info);
> >> +
> >>  /**
> >>   * rproc_coredump() - perform coredump
> >>   * @rproc:	rproc handle
> >> @@ -1584,6 +1606,11 @@ static void rproc_coredump(struct rproc *rproc)
> >>  	if (list_empty(&rproc->dump_segments))
> >>  		return;
> >>  =

> >> +	if (class =3D=3D ELFCLASSNONE) {
> >> +		dev_err(&rproc->dev, "Elf class is not set\n");
> >> +		return;
> >> +	}
> >> +
> >>  	data_size =3D elf_size_of_hdr(class);
> >>  	list_for_each_entry(segment, &rproc->dump_segments, node) {
> >>  		data_size +=3D elf_size_of_phdr(class) + segment->size;
> >> @@ -1602,7 +1629,7 @@ static void rproc_coredump(struct rproc *rproc)
> >>  	elf_hdr_init_ident(ehdr, class);
> >>  =

> >>  	elf_hdr_set_e_type(class, ehdr, ET_CORE);
> >> -	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
> >> +	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
> >>  	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
> >>  	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
> >>  	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
> >> @@ -2043,7 +2070,8 @@ struct rproc *rproc_alloc(struct device *dev, co=
nst char
> >> *name,
> >>  	rproc->name =3D name;
> >>  	rproc->priv =3D &rproc[1];
> >>  	rproc->auto_boot =3D true;
> >> -	rproc->elf_class =3D ELFCLASS32;
> >> +	rproc->elf_class =3D ELFCLASSNONE;
> >> +	rproc->elf_machine =3D EM_NONE;
> >>  =

> >>  	device_initialize(&rproc->dev);
> >>  	rproc->dev.parent =3D dev;
> >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> >> b/drivers/remoteproc/remoteproc_elf_loader.c
> >> index 16e2c496fd45..4869fb7d8fe4 100644
> >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> @@ -248,9 +248,6 @@ int rproc_elf_load_segments(struct rproc *rproc, c=
onst
> >> struct firmware *fw)
> >>  			memset(ptr + filesz, 0, memsz - filesz);
> >>  	}
> >>  =

> >> -	if (ret =3D=3D 0)
> >> -		rproc->elf_class =3D class;
> >> -
> >>  	return ret;
> >>  }
> >>  EXPORT_SYMBOL(rproc_elf_load_segments);
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index ed127b2d35ca..d67eb5a40476 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -515,6 +515,7 @@ struct rproc {
> >>  	struct list_head dump_segments;
> >>  	int nb_vdev;
> >>  	u8 elf_class;
> >> +	u16 elf_machine;
> >>  };
> > =

> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > =

> >>  =

> >>  /**
> >> @@ -619,6 +620,7 @@ int rproc_coredump_add_custom_segment(struct rproc=
 *rproc,
> >>  						     struct rproc_dump_segment *segment,
> >>  						     void *dest),
> >>  				      void *priv);
> >> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 ma=
chine);
> >>  =

> >>  static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *=
vdev)
> >>  {
> >> --
> >> 2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
