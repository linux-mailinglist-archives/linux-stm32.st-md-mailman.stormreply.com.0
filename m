Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FpdBKMkBWq3SwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 03:25:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30AF53CAF5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 03:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37DD7C8F290;
	Thu, 14 May 2026 01:25:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13369C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 01:25:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD9DD43E89;
 Thu, 14 May 2026 01:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76109C19425;
 Thu, 14 May 2026 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778721950;
 bh=AxoTvoWNfZ0N/+JEAYdEeXDvJlySu93nmK/tcGEpdCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ohp60svguPn9VJ91KLcWrSF309vSbtyAuPSAL/QkJnoEjZsQVEyEMjMZoEvMvI3TL
 giBT5kNy12kDo2kCnhG8yE8Sxxs6IR0gbe5Q/a7+zI4c7xEOJVCIszHw7JqPEQdSgE
 Ce30DVL+fmagRlxvsjmqvbXA25aJfxU6DBNV60oNjHXah78uM9Ud6OUub/8adLTlh5
 tpjHAByxUD4IRBBmcnmxbgaXFU6uZYnGyEZqRRQ+JZP3kRGfRIlM6LCFXZqtZlt04I
 Y2VbaX/vQmU3ulRzk5eqFsZ4M3ELZttB7npVcd1LbBNUxSs6fGrjGkd8em84cxxsAM
 xtbO+hdClC7JA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 31A781AC58CE; Thu, 14 May 2026 02:25:48 +0100 (BST)
Date: Thu, 14 May 2026 10:25:48 +0900
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Message-ID: <agUknFcDIfwrOCld@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260513104329.81592-3-phucduc.bui@gmail.com>
X-Cookie: Truckers welcome.
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for
	spin locks
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
Content-Type: multipart/mixed; boundary="===============5243023822214588589=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: A30AF53CAF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,sirena.co.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action


--===============5243023822214588589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNeucMHgTrsFwFqi"
Content-Disposition: inline


--jNeucMHgTrsFwFqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 05:43:27PM +0700, phucduc.bui@gmail.com wrote:

> @@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_subst=
ream *substream, int cmd,
>  					   I2S_IER_OVRIE,
>  					   (unsigned int)~I2S_IER_OVRIE);
> =20
> -		spin_lock(&i2s->lock_fd);
> -		i2s->refcount--;
> -		if (i2s->refcount) {
> -			spin_unlock(&i2s->lock_fd);
> -			break;
> -		}
> +		scoped_guard(spinlock, &i2s->lock_fd) {
> +			i2s->refcount--;
> +			if (i2s->refcount)
> +				break;

How does scoped_guard interact with break statements - does this still
apply to the switch?  I've not looked at how they're implemented...

--jNeucMHgTrsFwFqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFJJsACgkQJNaLcl1U
h9A0LQgAgCudCBnqt8GRh9fItnTaswFb1n89iM98BFvGsp0OcKXQzs4y9LipC6PM
AYYBv9nS0EwFC/llo3irahgb3HBMCiNaWybxgB+ugoYvpRxyruZbvRrGv2GD+s+d
TWhA5K2IS4pa3QnN92xa6C8qizSVO0cQaiGN29KUnc76fe6xLAMJRmnBjeuzREIP
kWTBPp1TTcckQAMbsfYGNPXxk2E4na8lc4vCkqTeDyMFtou6rjBnDUVMYL7/Fgcj
4RtoQjoWnhpMDWwEAi1eTmfiIZu/8lEhC4BERarbLebL9OONQuU/ivc9JAJUclZH
211Q9ZSJGs83gx3iA3gE40STi52s/w==
=x6Dg
-----END PGP SIGNATURE-----

--jNeucMHgTrsFwFqi--

--===============5243023822214588589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5243023822214588589==--
