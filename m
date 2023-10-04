Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 845347B7653
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 03:37:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D9CFC6C821;
	Wed,  4 Oct 2023 01:37:59 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C1B3C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 01:37:58 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-49abb53648aso695087e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696383477; x=1696988277;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ut7xWoIyAkKaAS+UBG8acxM2uYnbNKB4bITE7OuyUn8=;
 b=IuYbUGW/jhv7weOJ+5aoVgNPQDdGXpThZLsyr9ATR++AyvpXuaU4zs0S4Y3SLYP0ad
 mWisIKYzMnH9yFELkuxO2h7QOU8rveMGO4gvJWq0aeYeDlaMrLt8iuqUsih7rw8ay84r
 Y8hHJO4ztoe+ZCQ4acahUax//+f2y1I74V+sPhwnniToBYpVMeQr92+aS9oLydmYp00o
 V2pih6Oz4l7x3/Si11UHWfIdWIP3Ddr6C7nje1Ua+57hPsG8JkRrdmh+B8ogR3VZ7XzN
 AvsSNzg4RrobBWrDT12BzX8mhtpJWLboNda+vIsYyiPvH/xqi5i9BKCTSBnZT8bfov7p
 JgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696383477; x=1696988277;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ut7xWoIyAkKaAS+UBG8acxM2uYnbNKB4bITE7OuyUn8=;
 b=XB9Lesa3jdNeCgQklQawq9XG3hcKpemVagAhxLdhUkCNY0IwimpOqC73vsE5BryWM+
 V54wjKwIoQx4/tVEBm2otzq/pieTtj8RfC+D+97/vqimctWgNX6Wu+6xnsvM1KEi2XFu
 pUGGUOlAH2G3+5NUdFF1Gv+w0O/yK/djnF6VHjGZiOcwonvt0XBYQS+NHOMI6zbWuqPV
 bEnyLEsfbeWAwigkm034Ufw9HSzIWXdGx4PJlb4cYFMK8f5KV0s75rq4Y/Rc5FeFD7dy
 vVnCtdA2ec9sXsGb/N9M8ThS8MEr92p4IX3JKxxOMdmKHSbNciB+7lrWGxk0N0c10Jho
 qTRQ==
X-Gm-Message-State: AOJu0YwH7oDYlAvx2ZJPbgKuTWl4cEYdtuGOEwlRmt+zq7zBqli5xfIS
 LRuyEUeIt7+GI+9G6EkL+tDZvw==
X-Google-Smtp-Source: AGHT+IFe9WGtyUnwFgSpm2oOiz9vnIspKZLXWvuP1DOW+PgtsVRIlTTNJUn1eT68WXpwzGTuIifS6Q==
X-Received: by 2002:a05:6122:2208:b0:48f:cd3a:108 with SMTP id
 bb8-20020a056122220800b0048fcd3a0108mr1039736vkb.12.1696383476933; 
 Tue, 03 Oct 2023 18:37:56 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 c9-20020ac5c769000000b0049ab44fce7esm333804vkn.50.2023.10.03.18.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:37:56 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:37:53 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZRzB8f/SF4LSLS3c@fedora>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
 <20230922143920.3144249-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230922143920.3144249-2-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/6] tools/counter: add a flexible
	watch events tool
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
Content-Type: multipart/mixed; boundary="===============5913632422652512747=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5913632422652512747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ud/ll0XBucuOa13p"
Content-Disposition: inline


--ud/ll0XBucuOa13p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:39:15PM +0200, Fabrice Gasnier wrote:
> This adds a new counter tool to be able to test various watch events.
> A flexible watch array can be populated from command line, each field
> may be tuned with a dedicated command line sub-option in "--watch" string.
> Several watch events can be defined, each can have specific watch options,
> by using "--watch <watch 1 options> --watch <watch 2 options>".
> Watch options is a comma separated list.
>=20
> It also comes with a simple default watch (to monitor overflow/underflow
> events), used when no watch parameters are provided. It's equivalent to:
> counter_watch_events -w comp_count,scope_count,evt_ovf_udf
>=20
> The print_usage() routine proposes another example, from the command line,
> which generates a 2 elements watch array, to monitor:
> - overflow underflow events
> - capture events, on channel 3, that reads read captured data by
>   specifying the component id (capture3_component_id being 7 here).
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi Fabrice,

This tool is independent from the rest of the patches in this patchset,
so I suggest separating and submitting the next revision of this patch
independently.

> ---
> Changes in v2:
> Review comments from William:
> - revisit watch options to be less error prone: add --watch with
>   sub-options to properly define each watch one by one, as a comma
>   separated list
> - by the way, drop string/array parsing routines, replaced by getsubopt()
> - Improve command-line interface descriptions, e.g. like "-h, --help"
> - Makefile: adopt ARRAY_SIZE from tools/include/linux.kernel.h (via CFLAG)
> - remove reference to counter_example
> - clarify commit message, code comment: Index/overflow/underflow event
> - check calloc return value
> - Makefile: sort count_watch_events in alphabetic order
> - Makefile: add a clean rule to delete .*.o.cmd files

It looks like you implemented all the changes I requested in the first
review so I don't have much to comment inline for this revision.

It looks like the memory allocated (via calloc()) for the watches array
is never freed, so fix that in the next revision.

Also, add a MAINTAINERS entry with at least you as the point of contact
or someone else (an ST engineer?) who is willing to respond to any
bug reports the mailing list could get for this utility.

Regarding watch options, I looked up how a few other utilities handle
similar situations. Some utilities like the nftables nft command line
utility takes in a configuration file where you can specify the verbose
rule-sets, while others such as bfptrace allows entire programs to be
specified via one-liner constructs passed in a single option ("-e").

Although powerful, I found those approaches to be far too complex for
our simple test utility here. Instead, uilities with a simpler interface
take an approach similar to yours by providing several well-defined
sub-options; for example, to filter tcpdump packets users can provide
the particular sub-options they desire ("-i eth0 port 22").

The watch option solution here with sub-options is simple and clear, so
for now let's go with it as you have it. If the need arises in the
future for a more complex option interface, we'll tackle it as it comes.

Thanks,

William Breathitt Gray

--ud/ll0XBucuOa13p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZRzB8QAKCRC1SFbKvhIj
K8MOAP40On/mofJvCleupa6Ta0fCuH3zADKugk7CCkCLpyljWwD/TAi5GM0LSIWa
mlOzR+0lN8QEY6op3Qh1ojgvHuugqgQ=
=cxjL
-----END PGP SIGNATURE-----

--ud/ll0XBucuOa13p--

--===============5913632422652512747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5913632422652512747==--
