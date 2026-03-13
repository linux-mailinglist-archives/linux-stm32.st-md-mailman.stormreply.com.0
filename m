Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPfIAvpLtGk4kAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 18:40:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B92288373
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 18:40:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BB2AC8F29D;
	Fri, 13 Mar 2026 17:40:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DB9CC87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 17:40:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3628943F15;
 Fri, 13 Mar 2026 17:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7FEC19421;
 Fri, 13 Mar 2026 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773423606;
 bh=PDjv6lj0xs4XAnUT9GLFnTkZ2gh6Ra2uKalbK9P5GpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z7jDdA5hNBdPqR6CluugKTJvOAnuiKRttDzV9aIbeiuNP5DlzDXBzKdsTdJi+0UOJ
 +YSaSYoQudfpgl87Hl6hzQGq+hUuzqE82xnmxpGi6/YF3zd0Ft8RQePkPSOWweGjb/
 vYKmi1DRJ6IutTjJYn/8Cy8OpE/GA4Ye/H9t6xbBzAycQgr+4HWS/6asI5GPBmgoy0
 j3OQIJ1MLXpDrNkyVq6GAJIp1aJ0ax4IqRZTI6N+XaikwIW4jfiWAGTKlgTqUPgzJY
 pzyOlmuEm6Fw6jsnKv6PcNRAaMTNsLBj9t+dnoztdJV/tQHWBoqCrYndLxySPrvYkO
 AdwLJTL5rNcRg==
Date: Fri, 13 Mar 2026 17:39:58 +0000
From: Conor Dooley <conor@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260313-stiffness-item-c451eaef970d@spud>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
 <20260313075351.1584-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <20260313075351.1584-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
Content-Type: multipart/mixed; boundary="===============3881820476368454321=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
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
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,nxp.com:url,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: A1B92288373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============3881820476368454321==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7F9kwIhbyHy1RjqW"
Content-Disposition: inline


--7F9kwIhbyHy1RjqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 03:53:51PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
>=20
> Due to chip backend reasons, there is already an approximately 4-5 ns
> skew between the RX clock and data of the eth1 MAC controller inside
> the silicon.
>=20
> For 1000M, the RX clock must be inverted since it is not possible to
> meet the RGMII timing requirements using only rx-internal-delay-ps on
> the MAC together with the standard 2 ns delay on the PHY. Therefore,
> even on a properly designed board, eth1 still requires RX clock
> inversion.
>=20
> This behaviour effectively breaks the RGMII timing assumptions at the
> SoC level.
>=20
> For the TX path of eth1, there is also a skew between the TX clock
> and data on the MAC controller inside the silicon. This skew happens
> to be approximately 2 ns. Therefore, it can be considered that the
> 2 ns delay of TX is provided by the MAC, so the TX is compliant with
> the RGMII standard.
>=20
> For 10/100 operation, the approximately 4-5 ns skew in the chip does
> not break the standard. The RGMII timing table (Section 3.3) specifies
> that for 10/100 operation the maximum value is unspecified:
> https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processor=
s/20655/1/RGMIIv2_0_final_hp.pdf
>=20
> Due to the eth1 silicon behavior described above, a new compatible
> string "eswin,eic7700-qos-eth-clk-inversion" is added to the device
> tree. This allows the driver to handle the differences between eth1
> and eth0 through dedicated logic.
>=20
> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
> minimum and maximum constraints to reflect the actual hardware delay
> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
> validation compared to the previous enum-based definition and avoids
> regressions for existing DTBs while keeping the same hardware limits.
>=20
> Treat the RX/TX internal delay properties as optional, board-specific
> tuning knobs and remove them from the example to avoid encouraging
> their use.
>=20
> In addition, the binding now includes additional background information
> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
> control registers are included so the driver can explicitly clear any
> residual configuration left by the bootloader.
>=20
> Background reference for the High-Speed Subsystem and HSP CSR block is
> available in Chapter 10 ("High-Speed Interface") of the EIC7700X SoC
> Technical Reference Manual, Part 4
> (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual=
/releases
>=20
> There are currently no in-tree users of the EIC7700 Ethernet driver, so
> these changes are safe.
>=20
> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 =
SoC")
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

Krzysztof might not yet be happy with the compatible naming, but from my
pov:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7F9kwIhbyHy1RjqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRL7gAKCRB4tDGHoIJi
0qJLAP0c1yh00ld+1PBzXG2QWRzTWLz4Bu2S3D1IL4VcXwRdmAD8D13YNNMzL8Jb
WJXhFrH1ZO+pCsRM64k+gar0NbK4lwc=
=pXlI
-----END PGP SIGNATURE-----

--7F9kwIhbyHy1RjqW--

--===============3881820476368454321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3881820476368454321==--
