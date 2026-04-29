Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANNmOeNJ8mnNpQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 20:11:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C4498CBE
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2026 20:11:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A29C87EDB;
	Wed, 29 Apr 2026 18:11:47 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7570DC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1777486304;
 bh=vVHtEP46vGKolJeaCtgCNYw3z2ZwVl3u6h4t7hanr/Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ewbsn7RsB40xrAgPa5Bt4o5YasSBzfCpYAa5hJAcwhvoee//1lhLEL4dBxIxE02fT
 377ycqD41TJX1eAocyvNU5r0RozZ16EWrWFFAbFuMHMP8721NsQ0u8JvDVmnxU8yQD
 h+KJ6pMsL8PVxghCIF5D1fotq2uEXqpReN0jdKIBjrekbSDDeFz9kpyS6tRBdGxmVO
 dKOKNYdZtl4YE0DkDvos5ajf1QVWgimYG8EXuaWXbuOdQwRNmgJZRS3bNoODeH5wxk
 vsxC85TM9D836M2JgN+f6bSyxzrF+JYqZ00fTrTKJPXjBMhygefczmatRlPIiVzeTn
 +j2i9I+mM04KA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3381517E0EBB;
 Wed, 29 Apr 2026 20:11:42 +0200 (CEST)
Message-ID: <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Frank Li <Frank.li@nxp.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>
Date: Wed, 29 Apr 2026 14:11:41 -0400
In-Reply-To: <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
 <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, imx@lists.linux.dev, wens@kernel.org,
 kernel@collabora.com, p.zabel@pengutronix.de, samuel@sholland.org,
 linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@pengutronix.de, mchehab@kernel.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Subject: Re: [Linux-stm32] [PATCH v3 1/2] media: verisilicon: Simplify
 motion vectors and rfc buffers allocation
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
Content-Type: multipart/mixed; boundary="===============4721435101710802337=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 7A4C4498CBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:benjamin.gaignard@collabora.com,m:mcoquelin.stm32@gmail.com,m:imx@lists.linux.dev,m:wens@kernel.org,m:kernel@collabora.com,m:p.zabel@pengutronix.de,m:samuel@sholland.org,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:jernej.skrabec@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-media@vger.kernel.org,m:kernel@pengutronix.de,m:mchehab@kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:heiko@sntech.de,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,collabora.com,pengutronix.de,sholland.org,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,sntech.de];
	NEURAL_SPAM(0.00)[0.978];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[collabora.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,stormreply.com:url,stormreply.com:email]


--===============4721435101710802337==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hO3VKyof1zFkkmRUWXyp"


--=-hO3VKyof1zFkkmRUWXyp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

Le vendredi 17 avril 2026 =C3=A0 06:54 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Wed, Apr 15, 2026 at 04:04:19PM +0200, Benjamin Gaignard wrote:
> > Until now we reserve the space needed for motion vectors and reference
> > frame compression at the end of the frame buffer.
> > Disentanglement mv and rfc from frame buffers by allocating
> > distinct buffers for each purpose.
> > That simplify the code by removing lot of offset computation.
>=20
> Can you try split to more small and straight forward patches, for example
>=20
> for example create patch just move hantro_h264_mv_size() to header file,

Marking this has Change Requested, as I completely agree with Frank that a =
split
of this giant will help proper review.

Nicolas

>=20
> ...
> > +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
> > @@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ct=
x *ctx,
> > =C2=A0	int i;
> >=20
> > =C2=A0	/* Find the reference buffer in already known ones */
> > -	for (i =3D 0;=C2=A0 i < NUM_REF_PICTURES; i++) {
> > +	for (i =3D 0; i < NUM_REF_PICTURES; i++) {
> > =C2=A0		if (hevc_dec->ref_bufs_poc[i] =3D=3D poc) {
> > =C2=A0			hevc_dec->ref_bufs_used |=3D 1 << i;
> > =C2=A0			return hevc_dec->ref_bufs[i].dma;
> > =C2=A0		}
> > =C2=A0	}
> > -
> > =C2=A0	return 0;
>=20
> Move this code style change to new patches.
>=20
> Frank

--=-hO3VKyof1zFkkmRUWXyp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJJ3QAKCRDZQZRRKWBy
9H3UAQDXMPc16wto5clUhLZLnohxaOrBBoEinO5d3WvhOAdRDAEAq/QIRB2+WigR
13DyCJr+rFfmdUWiBtqbZtZoXN1CVgg=
=FgIy
-----END PGP SIGNATURE-----

--=-hO3VKyof1zFkkmRUWXyp--

--===============4721435101710802337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4721435101710802337==--
