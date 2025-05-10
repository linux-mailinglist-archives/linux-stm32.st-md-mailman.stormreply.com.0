Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE664AB3085
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF27C7A82E;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A21D5C7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 01:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1746839099;
 bh=BcDMEWZprG7/4QiD24tVvS5LuwgJ/uimoKaiXsdNfwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pJP9HTEmz5FOEBM56qol0g5N6SUdMlFbFZpCq3ExXL/74Sz1avpmYzT0KTq2bdrGV
 cIRC0a+W8UtU3SQ/QluU+rLoISJzQPmI9VMVwtINra9qUcOdXYugqnZIThnmzhrrzP
 j0puo3324XuwgSFJzqa1RFOMTagCJ2Shmu1weWpmnAncqrB+H6i5LsA6twye3v70J2
 PnkxpFIFN9X2jRIv7kIlXeRI82WD+yL3HwdFBzEc3Cakz1jTCyZ05jMEkc2TbQrP6p
 vOxc0gRD2vPSwSnWshNnZ9ZRPCynyZbCMD2InxVh7NknZd/OFS5X38uSVFryvpxQz1
 2mdNUYWOM6C6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZvSMY6BwVz4x5k;
 Sat, 10 May 2025 11:04:57 +1000 (AEST)
Date: Sat, 10 May 2025 11:04:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Message-ID: <20250510110455.10c72257@canb.auug.org.au>
In-Reply-To: <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
References: <20250509122348.649064-1-skb99@linux.ibm.com>
 <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Greg KH <greg@kroah.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Saket Kumar Bhaskar <skb99@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mykola Lysenko <mykolal@fb.com>, KP Singh <kpsingh@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Fix bpf selftest build
	error
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
Content-Type: multipart/mixed; boundary="===============0683297278471248914=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0683297278471248914==
Content-Type: multipart/signed; boundary="Sig_/993WEPoqNjDikEmM0EjdhpP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/993WEPoqNjDikEmM0EjdhpP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

On Fri, 9 May 2025 10:04:18 -0700 Alexei Starovoitov <alexei.starovoitov@gm=
ail.com> wrote:
>
> On Fri, May 9, 2025 at 5:24=E2=80=AFAM Saket Kumar Bhaskar <skb99@linux.i=
bm.com> wrote:
> >
> > On linux-next, build for bpf selftest displays an error due to
> > mismatch in the expected function signature of bpf_testmod_test_read
> > and bpf_testmod_test_write.
> >
> > Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_att=
ribute::read/write()")
> > changed the required type for struct bin_attribute to const struct bin_=
attribute.
> >
> > To resolve the error, update corresponding signature for the callback.
> >
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f=
6@linux.ibm.com/
> > Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> > ---
> >  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/too=
ls/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > index 2e54b95ad898..194c442580ee 100644
> > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
> >
> >  noinline ssize_t
> >  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> > -                     struct bin_attribute *bin_attr,
> > +                     const struct bin_attribute *bin_attr,
> >                       char *buf, loff_t off, size_t len) =20
>=20
> You didn't even compile it :(
>=20
> Instead of fixing the build, it breaks the build.
>=20
> pw-bot: cr

This patch is only needed in linux-next.  It should be applied to the
driver-core tree - since that includes commit 97d06802d10a.  It should
also have a Fixes tag referencing commit 97d06802d10a.
--=20
Cheers,
Stephen Rothwell

--Sig_/993WEPoqNjDikEmM0EjdhpP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgepjcACgkQAVBC80lX
0GxVWwf/ZkvwI39VdsR9Cc6eDfSrM4MHj5NBvGGV6tUNoYclSENR/DyT+68SZ798
AzGX3tpbarQ3OT/LAbWpSMAl62GzV22LVn3R5+6W/067tygXXF97X7tmEr6kPIfH
csvUrXewvX7QLH0BO1MTMRHHdjlgydBY86wPmMWi7HOuxDRJhzGCeit3hWfCEdA7
OyKyOwzemjv7PrRwe/ybaZXnq2tdLYF1YNiFqUVsVrGu2WMCfnkE6nBaCT5+cUbX
biLx1adyPWW5NMo4wf0gMwF24JvcS8IjcRZcL2e3UfWMhaGLGZ7EN4aOYX9bq0mL
EtYXBv74Qm7vWGhjtommtPMxlU2ILg==
=yAPB
-----END PGP SIGNATURE-----

--Sig_/993WEPoqNjDikEmM0EjdhpP--

--===============0683297278471248914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0683297278471248914==--
