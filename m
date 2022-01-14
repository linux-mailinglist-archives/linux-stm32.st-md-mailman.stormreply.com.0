Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67948E1B5
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 01:45:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7560CC5F1F5;
	Fri, 14 Jan 2022 00:45:56 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DB4AC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 00:45:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmkfQ-1mRiNQ00qE-00jnYs for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 01:45:54 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so2575717wmj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 16:45:53 -0800 (PST)
X-Gm-Message-State: AOAM5335gd2em0sW8bddpmKfnOPPy2st6L2il/+xtumw+dy/aqbYVL1Y
 RphiZWtM6BXhpfewxr2F0JN5NWbAEHq2M2Yfyhw=
X-Google-Smtp-Source: ABdhPJwV4G3A5mpFnAW11HwlY/Tf7y1xRC36rwdQkkqDkkOWfKAxxiuv8Puk8O7tRRiiu1Ah39q+R3OAJUeOa6nnmfM=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr6081734wmk.98.1642121153661; 
 Thu, 13 Jan 2022 16:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-2-philippe.cornu@foss.st.com>
In-Reply-To: <20220113171921.17466-2-philippe.cornu@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 14 Jan 2022 01:45:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
To: Philippe Cornu <philippe.cornu@foss.st.com>
X-Provags-ID: V03:K1:fvHzV5QrfcFE5nmIzh+JzjOgxspxzxqMUpVctTWd9N1W+F5kOVA
 dSchuMYo7gSTfavwflYsYp2TL+GrUUguRhyOZQlFvetdnBjYAMyYCAesyNAymJ8xfyYwKo0
 G8kEuTSEkqUiJTA47oNNECol9t83dwKD8hY9264JGjHXEwLkfMxniFiQLaiDA0D/3zKfSWw
 boS/R2m0L0KGSRYnX7htw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tKbQx4C83k8=:X9fs98/DJ8shIayMM//vu+
 Xw/8oZ7AnsJJhk8ePNr7oPN2EqbwCSGXWcTCUZTahMPvxsv0XVu5nutPYsLZWszA6GZKr0L04
 HdJcdbyyaD52TUuHJt7n6SCUfiAD4s5/c4/kh3NLuBCjoqpxnCDEdVC3HaEkaqQcCVpW/8X9r
 ItZweZa+UNfJVhL9d+j7jq4+PKwxiykJOVtoDuNWc1YNuJrLRbY54r8aQMGJvCrLz8s4wjcCc
 b66AO/f2RpWj9N3/HRQv5kG2Qta6f3QxAgCr7FIve/14GynmjuOO/3wwhoYcYZmY2iJEA1Zgp
 FldAIsn/yxmjGjihSXcAZJW8F4KlV+CDFB7TYXluReHbf3Rdr2kR79kv94hCVjj0WrRKRpkos
 iNJnMGgn6nl6mTH1pMl2BdDn0cbFqQ5gJCOinVPNsQSRTcC+JO2EbY1fIsC9e2/qDYFNVQDex
 dyUmIopajQEhfzQzWSmtTVKiWEK68K+tIZvdRuu4OlLqfjh5sKJLccm7uzA0xr9AOnZiMMxNh
 2T5rnnklxGa96HzIUaOrnbCGMS0GjigbbXpX/3gB/jjrInWgV+czg1581tA/t4lMBATzLU0UI
 QIZWyh6cslWBb0jjJEVlZjmjY1kYQkVXg67JJ1GGp73oyhMrM0vtmcZzQUh7KbEP8DNgfArgI
 Spx5ssA9LgQkhheEIKKSvfF6PKDM4ah8287xp4GbOSyY3t6vnj7A5qjlfF1LJBu8oGEhm9jkr
 /Vnhb4GAxF6oz9B64D3Z9m2sqi7CZUqVe63fvTsspT/GvNj1V0cVFc96/nZcB9TnHQ6uHf2ct
 8cVJ56n5yrSQ6/oGYGjU90poMCRAsctGaJeRy6K0V8wrDsE0C8=
Cc: David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alain Volmat <alain.volmat@foss.st.com>, Laura Abbott <labbott@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linaro-mm-sig@lists.linaro.org,
 SoC Team <soc@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Konig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] MAINTAINERS: Update Benjamin Gaignard
	maintainer status
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

On Thu, Jan 13, 2022 at 6:19 PM Philippe Cornu
<philippe.cornu@foss.st.com> wrote:
>
>  DRM DRIVERS FOR STI
> -M:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc

If there is no longer a maintainer, I suppose it should also be marked as

S: Orphaned

         Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
