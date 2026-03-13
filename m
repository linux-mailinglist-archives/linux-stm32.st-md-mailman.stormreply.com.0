Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fg5NM3XKs2n2awAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:27:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0627FA21
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:27:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10DCCC8F28F;
	Fri, 13 Mar 2026 08:27:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 305A9C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 08:27:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B75E660142;
 Fri, 13 Mar 2026 08:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7BEC19421;
 Fri, 13 Mar 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773390450;
 bh=LjjmvM/vmaS4//USd0RW7tvsnLCWGGdQkTrz5/AWVp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DPPni+lYDoaOn1Ag3kuyj0AQj8FTTurKfSI6YHa2F1wcx6tllEIeZERg44A1o40lL
 NBgrny4mrciTQTm+Braqu4OFRCMM3dcYEl1SHuJn4iDd9eRGqPxvL+UA852MIdW1xF
 SU4qi3rDQEUScohJtYI4mFVdAlGmyojMScYhw3bsrx29Ctigy+thqVIS/BMMK8vkJE
 GlSG9027eyW1Z6idxnfM4oYSyygA1YCYXWob/GSoDv3hKVvFXgmqIY+8tO+Vxxefc7
 nE/NQGUNBnxc/LXfIESoIQGzHbiVGdOD+0wOJNk7YzS0cgMAr083vwFOGNaBac56TH
 ZjMXgLfJ2F34g==
Date: Fri, 13 Mar 2026 09:27:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20260313-dexterous-lively-jaguarundi-72bfef@houat>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260312181654.2d9ba69c@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Radu Rendec <rrendec@redhat.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mips@vger.kernel.org, sophgo@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos:
 add support for SCMI power domains
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
Content-Type: multipart/mixed; boundary="===============1880307773502636984=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:dfustini@tenstorrent.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-mips@vger.kernel.org,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.q
 ualcomm.com,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:martinblumenstingl@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,tenstorrent.com,bootlin.com,oss.qualcomm.com,googlemail.com,oss.nxp.com,bp.renesas.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 6BC0627FA21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============1880307773502636984==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pxy5ukm7k3gyqla3"
Content-Disposition: inline


--pxy5ukm7k3gyqla3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
MIME-Version: 1.0

Hi Jakub,

On Thu, Mar 12, 2026 at 06:16:54PM -0700, Jakub Kicinski wrote:
> On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >=20
> > It also reorganizes the ethqos code quite a bit to make the introduction
> > of power domains into the driver a bit easier on the eye.
>=20
> Not entirely sure what the conclusion was in the sub-thread with Russell
> but FWIW this doesn't apply to net-next as posted so respin will be
> needed either way.

We'd really like for this series to go in, so fwiw I'd prefer that we
don't create a dependency on a series that has never been posted for
this to be merged.

Maxime

--pxy5ukm7k3gyqla3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabPKagAKCRAnX84Zoj2+
dq/cAX9HbQPDp+u+6RAvVqRXiVlUqq7qrs2GAioBq5qsajRY1mqIABlDjHVyOc8v
8oDz3SwBfiJTavhwpPgjJQ9YAcH4JcHjnzxAs88eFjbDLDYSe2mAKK7fP8U02MfH
qIGBmEr8gg==
=zTCu
-----END PGP SIGNATURE-----

--pxy5ukm7k3gyqla3--

--===============1880307773502636984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1880307773502636984==--
