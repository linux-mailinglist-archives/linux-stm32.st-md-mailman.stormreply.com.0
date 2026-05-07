Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O5qM7zK/GlhTwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:24:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6D4ECD2C
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 19:24:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9B83C8F289;
	Thu,  7 May 2026 17:24:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DA1DC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 17:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CDD5F6024D;
 Thu,  7 May 2026 17:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D79C2BCB8;
 Thu,  7 May 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778174648;
 bh=/sS7TF2P2okui5cV7b+Als4wJCVp4SLHRLCa7RkEj1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdswB355jFD2zrL4Pa+3RgmzzXRASCQOfMaY250v5ADrpPwzKPyQ1reRgmi8vIUZX
 jg78dR41y+75bhPNSSaT/tDhc3FnIAYrUQw+F5xWj7EYJscwL6jV6nc94PiCzcApH6
 T1hWAFr/JRX2P0n8P1LCU0LZuDvk+gGlWW5pe1X2IvGG7H4ZvNlPkX7CkPpISf8wWJ
 0Fr4DKckV79NbiPyAipnYFyv9zmJ6TZ1MIBZUNwUbZKEYuptfOieHc2822Y3Bcs80P
 9KpiTUmdyD88nqopJAO7X7HE7VgsCKFawK4wJ8lzjPwpUaMwgc7plAmtM3VncEmcfA
 ES7AXyQilubfA==
Date: Thu, 7 May 2026 18:24:02 +0100
From: Conor Dooley <conor@kernel.org>
To: lizhi2@eswincomputing.com
Message-ID: <20260507-mural-moocher-ad6e07ef8ae0@spud>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <20260507083136.175-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] dt-bindings: ethernet: eswin:
 refine delay model and HSP register description
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
Content-Type: multipart/mixed; boundary="===============2915403935860297124=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 63C6D4ECD2C
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
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.763];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[3.1.11.0:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action


--===============2915403935860297124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75aYy/57ywRVeCVd"
Content-Disposition: inline


--75aYy/57ywRVeCVd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:31:36PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
>=20
> Refine the EIC7700 Ethernet dt-binding based on observed hardware behavior
> and clarify the original delay model for eth0.
>=20
> The previous binding used an enum-based definition for
> rx-internal-delay-ps and tx-internal-delay-ps. Replace it with a
> range-based model using:
>=20
>   - minimum: 0
>   - maximum: 2540
>   - multipleOf: 20
>=20
> This better reflects the actual hardware implementation, which
> supports 20ps granularity delay steps in the MAC RGMII interface.
>=20
> The tx/rx internal delay values are clarified as MAC-side programmable
> delay components applied on the RGMII clock/data path, representing
> the effective delay seen at the MAC interface.
>=20
> This does not change the intended hardware semantics, but aligns the
> binding with the actual hardware implementation.
>=20
> These properties are optional and only required when MAC-side fine
> tuning is needed; otherwise delay alignment is provided by PHY or
> board design.
>=20
> Depending on the selected RGMII timing mode, delay alignment may be
> provided by the PHY (e.g. rgmii-id) or by board/MAC-side configuration.
> When PHY or board design already provides the required delay, these
> MAC-side properties may be omitted. When MAC-side fine tuning is
> required, they should be provided to describe the internal RGMII
> timing adjustment.
>=20
> Additionally, extend the description of the HSP subsystem register
> layout used by the MAC glue logic. This includes explicit TXD and RXD
> delay control registers to ensure deterministic initialization and
> to override any residual configuration potentially left by bootloaders.
>=20
> Add reference to the EIC7700X SoC Technical Reference Manual,
> Chapter 10 ("High-Speed Interface"), Part 4 for background of the
> HSP CSR block:
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual=
/releases
>=20
> There are no in-tree users of this binding, so no ABI impact is
> expected.
>=20
> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 =
SoC")
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---

While this is v1, it's really v8 and there should therefore be a
changelog that explains where my ack and the new compatible went.

Cheers,
Conor.

>  .../bindings/net/eswin,eic7700-eth.yaml       | 50 +++++++++++++------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 91e8cd1db67b..fab95603bd82 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -63,16 +63,39 @@ properties:
>        - const: stmmaceth
> =20
>    rx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    minimum: 0
> +    maximum: 2540
> +    multipleOf: 20
> +    description:
> +      RX internal delay in picoseconds applied on the RGMII clock at the=
 MAC
> +      side. The hardware supports 20 ps steps.
> +      This property is optional and only needed when MAC-side delay tuni=
ng
> +      is required.
> =20
>    tx-internal-delay-ps:
> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +    minimum: 0
> +    maximum: 2540
> +    multipleOf: 20
> +    description:
> +      TX internal delay in picoseconds applied on the RGMII clock at the=
 MAC
> +      side. The hardware supports 20 ps steps.
> +      This property is optional and only needed when MAC-side delay tuni=
ng
> +      is required.
> =20
>    eswin,hsp-sp-csr:
>      description:
>        HSP CSR is to control and get status of different high-speed perip=
herals
>        (such as Ethernet, USB, SATA, etc.) via register, which can tune
>        board-level's parameters of PHY, etc.
> +
> +      Additional background information about the High-Speed Subsystem
> +      and the HSP CSR block is available in Chapter 10 ("High-Speed Inte=
rface")
> +      of the EIC7700X SoC Technical Reference Manual, Part 4
> +      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
> +      publicly available at
> +      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference=
-Manual/releases
> +
> +      This reference is provided for background information only.
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
> @@ -82,6 +105,8 @@ properties:
>            - description: Offset of AXI clock controller Low-Power request
>                           register
>            - description: Offset of register controlling TX/RX clock delay
> +          - description: Offset of register controlling TXD delay
> +          - description: Offset of register controlling RXD delay
> =20
>  required:
>    - compatible
> @@ -93,8 +118,6 @@ required:
>    - phy-mode
>    - resets
>    - reset-names
> -  - rx-internal-delay-ps
> -  - tx-internal-delay-ps
>    - eswin,hsp-sp-csr
> =20
>  unevaluatedProperties: false
> @@ -104,24 +127,23 @@ examples:
>      ethernet@50400000 {
>          compatible =3D "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
>          reg =3D <0x50400000 0x10000>;
> -        clocks =3D <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> -                <&d0_clock 193>;
> -        clock-names =3D "axi", "cfg", "stmmaceth", "tx";
>          interrupt-parent =3D <&plic>;
>          interrupts =3D <61>;
>          interrupt-names =3D "macirq";
> -        phy-mode =3D "rgmii-id";
> -        phy-handle =3D <&phy0>;
> +        clocks =3D <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 193>;
> +        clock-names =3D "axi", "cfg", "stmmaceth", "tx";
>          resets =3D <&reset 95>;
>          reset-names =3D "stmmaceth";
> -        rx-internal-delay-ps =3D <200>;
> -        tx-internal-delay-ps =3D <200>;
> -        eswin,hsp-sp-csr =3D <&hsp_sp_csr 0x100 0x108 0x118>;
> -        snps,axi-config =3D <&stmmac_axi_setup>;
> +        eswin,hsp-sp-csr =3D <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
> +        phy-handle =3D <&phy0>;
> +        phy-mode =3D "rgmii-id";
>          snps,aal;
>          snps,fixed-burst;
>          snps,tso;
> -        stmmac_axi_setup: stmmac-axi-config {
> +        snps,axi-config =3D <&stmmac_axi_setup_gmac0>;
> +
> +        stmmac_axi_setup_gmac0: stmmac-axi-config {
>              snps,blen =3D <0 0 0 0 16 8 4>;
>              snps,rd_osr_lmt =3D <2>;
>              snps,wr_osr_lmt =3D <2>;
> --=20
> 2.25.1
>=20

--75aYy/57ywRVeCVd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzKsgAKCRB4tDGHoIJi
0kXYAQDSJ5Nb/+ywgAZ6JhcPy0ioHT02zVbqxDPEW5juK6NEAgEA3mw2372IXYbh
JQseHS5qL3qXMdFwjwp4T713jZ3Ybws=
=kGYF
-----END PGP SIGNATURE-----

--75aYy/57ywRVeCVd--

--===============2915403935860297124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2915403935860297124==--
