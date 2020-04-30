Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94501BF904
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 15:14:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92F8EC36B0E;
	Thu, 30 Apr 2020 13:14:15 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE0B4C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 13:14:13 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id p13so2900391qvt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pDdNvxiaHux68POpVOp2tfQ9DF2c5DQah7EUfVYCx48=;
 b=E0h/T0SHPd8VBNoJF8aBlM6G0p9wcDVCz80Sn50j4stfFRESoyn4/8aBAm4wiI/h8W
 cJtfqFoOP2uoHiEQxrbtiMAFoG/MUAy9qA/bYv3H1EkAlpTHTpk3UrqjXBfHMgPpcf+Q
 8STgihdHuZypZe+LYN4XMOEboF22wQmoGSjWzV8CMvj+ge85/0l5ulwfpuzN8UOtWsv9
 4WRr5Oi2iYznpzTsenrbuimRf6DvCq4didSJnpikbDkztan2cqA6Tvq70gWjjTotiYjL
 E8ffjaCXtOq2HlX50pDlgqg8rRQRrRSDvi5Ta9g7J07q2biMniAibTY9hiWP7SvwuEfH
 PM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDdNvxiaHux68POpVOp2tfQ9DF2c5DQah7EUfVYCx48=;
 b=uk2RQIA94lUfREyUNsJWvhlEuhqOKTIqnwxAtKFXhMRKA3ylbixnVlnHPhOs0vOl8g
 aLKyyb4jb0OqtQNhVGLyblp5XpO6Kh72O3+HpwLEozmA5fmaDbkmGNGfQkfTOzql9zKF
 AQq+ClOt5Ot86isAIqzefqf72lXiYpC0Pq9A9zVAgW5KQ1RpLDEanqNcH9sr4/AP5Vir
 QhtwVDWMkO4b8BVwYIj82ZyM6B6hZ5a78bZQbvI+ImrYr6MrX3HHLmGx0VhZgANOe7/V
 8/Wu8sTetc6qr9317Pz5XGkY/t/p5NY6JOGuHEJyM357H/w9R9DmcTbThWka6nCtNsGA
 HnMg==
X-Gm-Message-State: AGi0PuZT/uHtI3S41fX3j1ZDB2C5RBz4TxPG4p3MNnokZsXb9uk2rfoe
 ShXhRjEEI6x1wJulhHGa0Ro=
X-Google-Smtp-Source: APiQypLZgkNpKfCBuKLEZD2YLW/rJjGZln92wUBimE1AWUJGk335FmNHsaMpWGh7zLEChyYWIrQx2Q==
X-Received: by 2002:ad4:5604:: with SMTP id ca4mr3001987qvb.6.1588252451956;
 Thu, 30 Apr 2020 06:14:11 -0700 (PDT)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id u5sm1807186qkm.116.2020.04.30.06.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 06:14:10 -0700 (PDT)
Date: Thu, 30 Apr 2020 09:13:54 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200430131354.GA3526@icarus>
References: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
 <202004301522.tS6NKxKy%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202004301522.tS6NKxKy%lkp@intel.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, kbuild-all@lists.01.org,
 david@lechnology.com, felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 fabien.lahoudere@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Internalize sysfs interface
	code
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
Content-Type: multipart/mixed; boundary="===============5892651252497662690=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5892651252497662690==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 03:41:26PM +0800, kbuild test robot wrote:
> Hi William,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on stm32/stm32-next]
> [cannot apply to linus/master linux/master v5.7-rc3 next-20200429]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>=20
> url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/I=
ntroduce-the-Counter-character-device-interface/20200430-051734
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git=
 stm32-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/counter/stm32-lptimer-cnt.c:387:2: error: initializer element =
is not constant
>      stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE],
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/counter/stm32-lptimer-cnt.c:387:2: note: (near initialization =
for 'stm32_lptim_cnt_synapse_actions[0]')
>    drivers/counter/stm32-lptimer-cnt.c:388:2: error: initializer element =
is not constant
>      stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE],
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/counter/stm32-lptimer-cnt.c:388:2: note: (near initialization =
for 'stm32_lptim_cnt_synapse_actions[1]')
>    drivers/counter/stm32-lptimer-cnt.c:389:2: error: initializer element =
is not constant
>      stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES],
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/counter/stm32-lptimer-cnt.c:389:2: note: (near initialization =
for 'stm32_lptim_cnt_synapse_actions[2]')
>    drivers/counter/stm32-lptimer-cnt.c:390:2: error: initializer element =
is not constant
>      stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_NONE],
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/counter/stm32-lptimer-cnt.c:390:2: note: (near initialization =
for 'stm32_lptim_cnt_synapse_actions[3]')
>=20
> vim +387 drivers/counter/stm32-lptimer-cnt.c
>=20
>    385=09
>    386	static const enum counter_synapse_action stm32_lptim_cnt_synapse_a=
ctions[] =3D {
>  > 387		stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_RISING_EDG=
E],
>    388		stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_FALLING_ED=
GE],
>    389		stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES=
],
>    390		stm32_lptim_l2c_actions_map[STM32_LPTIM_SYNAPSE_ACTION_NONE],
>    391	};
>    392=09
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

This array must be initialized with constants. I'll fix this up in v2.

Thanks,

William Breathitt Gray

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl6qzwYACgkQhvpINdm7
VJLk/Q//clynsmUq9lcU/8cY8gN9E4wlFY1nGI4H1LZM2GC9Pk6s7CMQjyiTY1Lf
VKUk7T/x2brPTsTR/ctE4Z1vCIBrZ7HzKE1qPBxm2P+CPSMJwbqYfPwhUwYO2GNH
HyAhx8VpxyHGTFJf/IMPFEPY6esJj8nEuj0DrTS8IE0/LqvMzDfaltTWW3eBc1Zl
0734KK8lUwe+4COZvsFkytii3yVVOHNfSQI6b5q1wdRqbLpRA3xQl7STYWsXv4s/
Ed0unHGG+bZPy9ITjTw7FcReGgZUrGZwe+TjFBpAad3Bva0GtW36+cle0m6Bcy6G
omgTRDfQXZkvYlN90CsLGnVhKUEMErsXzQ92HydrQQn6TcgaD4Al2+lKZLvfV5qV
XI9yEiCMyZOxkhOtxl0hAKO7oicM5JFq173nW0dcer0TGOkgCgWNUwb1OPOqYO7X
nh/er1AQRvh6N9MDH8Ypo48Is7z9rYYsYnwzSQ9K6Slyp241y0hJkJ0nhX4xl2Vv
Rn7EzJMvz2d5zLCCyQo8esXNu98Ws4KxF66rgL+0ErMLOS1DOEyAOr5hPHow2u5H
CCcTyCrCMgb46iJ34aHNqovWuLcnwtGYuTul1wuHORCeMCpUeyjDjQzC8MKIesH2
8/LY7e9xG+o/oFl1UNkwi5X1IVekUrCOm6/CAPswRV/tNxnxrmM=
=/poB
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

--===============5892651252497662690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5892651252497662690==--
