Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C/qOaXN/GlhTwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:36:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F114ECEFA
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:36:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4CEDC8F289;
	Thu,  7 May 2026 17:36:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F227C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 17:36:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9346D60181;
 Thu,  7 May 2026 17:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D93C2BCB2;
 Thu,  7 May 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778175393;
 bh=CBnvdCtqio5x+rdzVpAUsZ+Yt1D0ifLS7GO/amKxu8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFfZD6rDmPd2tof6tqbRKd0hSTLWkC8LhdTIO0WMsysIGVoeZayN4S/ovJ3G1uo6i
 U0XCcKWYWhWBAACgBb8lVfxA6+6tbCh1soGZnIRMrAZRWezWMDeH28WB/G4/YxyjME
 VRBw9MlMyYh3w53i2jXdOQN1UMp+53bJ+k6Hf5GcNKkXRplNAFuhzOt6u0fErVT0dr
 D8OvS57hGFZ5BFOW4VCXKCUpyUQDpEFO0B1DggWcrOagCa1EHv+VadJ0HupsEHn7zX
 v/NdJKrog8ePYi0A0Q1QXZS49QusjBcE3PqfwuT+GVTAZCmqVvwleQEUhhaEY+d95g
 CgtmfexX0uwXg==
Date: Thu, 7 May 2026 18:36:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20260507-jaywalker-saturday-5ca401263fd3@spud>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
 <20260507094115.8355-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260507094115.8355-2-minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v3 1/5] dt-bindings: net: starfive,
 jh7110-dwmac: Remove jh8100
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
Content-Type: multipart/mixed; boundary="===============0174052704965443442=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 89F114ECEFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.838];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action


--===============0174052704965443442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="As+pCEyLA+jvrCQl"
Content-Disposition: inline


--As+pCEyLA+jvrCQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 05:41:11PM +0800, Minda Chen wrote:
> Remove jh8100 dt-bindings because do not support it now.
> StarFive have stopped jh8100 developing and will not release
> it outside.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--As+pCEyLA+jvrCQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzNnAAKCRB4tDGHoIJi
0haTAQCxSVP4Athw6UsIb0NxnwU825Gobm4uR69WLX1ltTsgYQEAw/p3/1aqt4Gw
dLzwT2Cwk81tMPivdKLTEbUXjSxwkQw=
=jfQR
-----END PGP SIGNATURE-----

--As+pCEyLA+jvrCQl--

--===============0174052704965443442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0174052704965443442==--
