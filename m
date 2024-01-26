Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1B83DA82
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 14:05:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F832C6DD6F;
	Fri, 26 Jan 2024 13:05:25 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 989B8C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 13:05:23 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1706274323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr8QKXIT9eS/FyyD/NH8+PF7e0exuuXWzw58fkOb0Tw=;
 b=3Uhbhcg7EaINbhkZZsqTT4dahBwElAFdmYSv4WTRtFnJ2Gk5VEtDVrCXxj5VQC5QU6DICG
 Zk++iotOh+WSjveTl+Rj/zatNPKA49mwawGn0M58UEnTjGv+aarSi+Gj+slsDRdkrUZVdF
 N/dYwYnc72/eNLu01AwWMx4B4Y/Dg26Dw5xao552cBYqE/buzyMOKDiy5yxuH+3GXLeniM
 eoD8AX1hYOR23j72x2yaXVzFg66dfdX98MGM2vCOF4QeHgC6xlTnVXrQfCeprdqmh9nHuY
 0l0BTb+/c7vnGF8a1JpiCzTaWWohqYAJEVmIVffoXr6nOumo/OI1TZxMjHuaVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1706274323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr8QKXIT9eS/FyyD/NH8+PF7e0exuuXWzw58fkOb0Tw=;
 b=12qfUbjTTs06WtM/BZ2qEmPP4CDsQDtjCiphcmppyP7CsZPkkOX3VfvQDdmST9wOhYxG8a
 D3WhyJAojGBjHVDw==
To: Esben Haabendal <esben@geanix.com>, netdev@vger.kernel.org, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <379f79687ca4a7d0394a04d14fb3890ce257e706.1706256158.git.esben@geanix.com>
References: <cover.1706256158.git.esben@geanix.com>
 <379f79687ca4a7d0394a04d14fb3890ce257e706.1706256158.git.esben@geanix.com>
Date: Fri, 26 Jan 2024 14:05:19 +0100
Message-ID: <87sf2kmei8.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Rohan G Thomas <rohan.g.thomas@intel.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-imx: set
 TSO/TBS TX queues default settings
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
Content-Type: multipart/mixed; boundary="===============2406685805608072458=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2406685805608072458==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Fri Jan 26 2024, Esben Haabendal wrote:
> TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to
> use the first TX queue with TSO and the rest for TBS.
>
> TX queues with TBS can support etf qdisc hw offload.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Thanks for fixing this,

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmWzrg8THGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgsR4EACAixCTExVVvJKDoEaA5WUUXJCVboIg
jdMPpZgrqtDW5yPCCZ4KJYSGxhvinkc1aBi3M+SUwHodKYbLHea/0un3H9d4ejJp
Y4ly+Y5bJSquL/Hj53W0RsnNcsFDUN51un1at8EukUfGWBPoYJqsDG97KUvGF9sg
fb1pP0JuXOeUhKp3Mp2+e0sFjAhQwQrfGzSRnHkmRpModiKfysal3sLzynuLc1yV
YuqsHvoJLnlYdKIF9d8Cs6V5vZ0Qhxr59PGD7x/Drf/YLF/JZIKSNzTMpYzuD1zM
Ojed8Tyk5CBjNpb2+zX2Emce8m+bziw5XEUJ0xf/HpXUFBoyUwbYBYSRyFbNZsNP
h7cwZhBtybYzO49wVaaYC+1S/Y38/REMMVgh5sRBo35WFiVPtrVs+R3Q8Y69JXaw
87bA0z0iCQIHNUiId+exblegAj5wn+X1GfUCWoAcbOH9GgyrvEnmU7MxwEEBgPTZ
clROPBVOFdnCh6wenznF92XKJK/mmmDbUXw3me/DkYh4OwnVZ9ROgFDHxWIn2P6O
st/SsoqbfdOZmNTFnRit3EWhUbVozx/Ml8wAitITfbCBuwKl41mN3rR2sWtJHWtK
840sKRtZoGO5qoFk5L7of1cCKWQalUqlpqbBhBrIxlx8qw81Nt4gTvE0Fa80c6Cv
YU+SenSIi7lCxA==
=/9bz
-----END PGP SIGNATURE-----
--=-=-=--

--===============2406685805608072458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2406685805608072458==--
