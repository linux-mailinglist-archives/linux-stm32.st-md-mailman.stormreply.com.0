Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C66851363
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 13:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 559BFC6B45B;
	Mon, 12 Feb 2024 12:17:40 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35510C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 12:17:39 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1707740258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ss8+0g2Vw7bFP3dHKPiPH0ijjnT07QmFxhc8x5JkdWk=;
 b=XEUQiYyTxYObKen4QmrlRE5tC1bNSkyXawJkfGuiti5rRUsakKrPkkl14mjs9KQmujaO4i
 UW9tl+blTBQ5YMT158wXne/LNu1KH9qSFtIPk42yj1M0ExkuzfRdE9Z8D/m/qtS7hSv1U7
 QanaYsrAeoYbpezT7SS0ns+J9cadk9VyEn6wRHnjFAKVDBZJbcTp7m/OJ8Jz3+Tf6X4e/A
 cyOEuS0qk9SQo+VmM9eqovH89LBcZ1LBa3aaQSxcBOOnS30fo2BdhpXK/jhrIs7y4NNCge
 rTCIqkEzbNROcEEMEGGUOv0UVGJEmRfGm9y0GUEmXBxAGOWH3kbxiH+O6uSM2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1707740258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ss8+0g2Vw7bFP3dHKPiPH0ijjnT07QmFxhc8x5JkdWk=;
 b=cOe+9uRrx5U1EJs6y9RrsykUs92t+b95NGF4VPv7uAAjHG3AC+h6mI/a9i43cROcXruvqT
 bSO9Wqi2MqdmnSBQ==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
Date: Mon, 12 Feb 2024 13:17:37 +0100
Message-ID: <87il2t98ri.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Yannick Vignon <yannick.vignon@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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
Content-Type: multipart/mixed; boundary="===============8861523876070811185=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8861523876070811185==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Thu Feb 08 2024, Kurt Kanzenbach wrote:
> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
> interrupts") disabled the RX FIFO overflow interrupts. However, it left the
> status variable around, but never checks it.
>
> As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
> simplified.
>
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>

Hi Jakub,

why did this got marked as Changes Requested. What changes have to be
made?

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXKDGETHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgnngD/wOtmEmDPbwzPKAYz411R83LsJESiGo
ZgnRhNOzTYuOKVOS8aAEuyCjaj4Kc/jIhwrEhXxReei7fgEwMhvCkxBKS5q7VQvN
zJk/O5VgXPOcS2lE8/vg0hQaetztOAi/GpNF00YOlsSHT/wxtY2AwSZeXDOXrZDl
Ta6Uy78m6nVBTv4FHyKPQIoKHRfdhR/hhVUJh76dN+pRLezsSQvz1qygZLYyHjz9
8WoeGAzjSA9hk6L3/ECEMw+nn70IC7f0R33/hKRMYg0Z6f0UDzJnFrZ29QrWiqHM
W7to6wWFDqNfukWOpEVJF2FlPc/+88BQcGnNndSG/3roakLBxzdsl360hJAdxlPe
cwOJ2HRd8jByU6xJwnO3RcKhMdi/WyH7gmr9Q0S2fZE6vbq7EDfkCVhSwSyOEWUH
7nY6If+JuF1Ew3/Teixa9EKOHTUqndzTOmk4mqv+VmKum5T2gQRdE/P/kNmDrWZF
Us+vMyghfWN24flf3Mkf0/xyg6skucsYy6uMwhtBbZX1RQPvD0qDExALYEEnh7a8
nhNwlHd6/yxaoibxLfk1ftSKujnupPB8yI4B2sIfmJWmJ3sCTBeQbKEeM16mRX7D
I/Vq0TSoKl/zHQY7wrq3hvAWFWk0V8rX3uXEbB1byOvj54V4cph4CfyhfmHd3ZaG
O5ylu4WY7N0R3Q==
=Tj0h
-----END PGP SIGNATURE-----
--=-=-=--

--===============8861523876070811185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8861523876070811185==--
