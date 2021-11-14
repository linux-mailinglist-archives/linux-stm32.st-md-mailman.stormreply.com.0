Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED844F8AC
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Nov 2021 16:11:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD3BCC5C82A;
	Sun, 14 Nov 2021 15:11:44 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A416DC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Nov 2021 15:11:43 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636902703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1kkq3dBvp9yP0qQAQfqCNJaAwZ1cH/dykhm1gc7U1DE=;
 b=vYJ8tPv3bsai8XxzNGduhUb1IKvTJSSmuIbZBy3nMOcGzBMjYZyqnHuz9yCL5HIEuRDB7H
 97XC5Tsd6kSgTG5DQh8YFUHji/NG/fVBzcazmlSZpxo+8BtTbIA5L/Yuwcnys7USo0y1Fl
 UIrZtMrV/qQJguy9Mw8h5uA1/06LHdbQuduD2ehZhlrzz4zFj8zTTm13lkFyFYprl68vy0
 MrMGNV9J4B+GByCzXVHqNh8JBY9SdTyd4Zu+zL8PRVCeQVF1elcybURbXbsFKpFrUdcyUU
 sckfG46gRzJTkbE6w799xEITQFSR99CfVIi4z6nneK83T0zkM1RZyy0E42H+Hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636902703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1kkq3dBvp9yP0qQAQfqCNJaAwZ1cH/dykhm1gc7U1DE=;
 b=qWwEbKfHle08FAuryZkVz3s5AzyG3q0EEIWSwNf5liyxjKTuIrjIq6uSqr4mqvwYJNEON0
 pD3CKRcpWl55prDA==
To: Ong Boon Leong <boon.leong.ong@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>
In-Reply-To: <20211111143949.2806049-1-boon.leong.ong@intel.com>
References: <20211111143949.2806049-1-boon.leong.ong@intel.com>
Date: Sun, 14 Nov 2021 16:11:41 +0100
Message-ID: <87v90urcuq.fsf@kurt>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enhance XDP ZC
 driver level switching performance
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
Content-Type: multipart/mixed; boundary="===============1162981490608131619=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1162981490608131619==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Thu Nov 11 2021, Ong Boon Leong wrote:
> The previous stmmac_xdp_set_prog() implementation uses stmmac_release()
> and stmmac_open() which tear down the PHY device and causes undesirable
> autonegotiation which causes a delay whenever AFXDP ZC is setup.
>
> This patch introduces two new functions that just sufficiently tear
> down DMA descriptors, buffer, NAPI process, and IRQs and reestablish
> them accordingly in both stmmac_xdp_release() and stammac_xdp_open().
>
> As the results of this enhancement, we get rid of transient state
> introduced by the link auto-negotiation:
>
> $ ./xdpsock -i eth0 -t -z
>
>  sock0@eth0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 634444         634560
>
>  sock0@eth0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 632330         1267072
>
>  sock0@eth0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 632438         1899584
>
>  sock0@eth0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 632502         2532160
>
> Reported-by: Kurt Kanzenbach <kurt@linutronix.de>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

Tested-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGRJy0THGt1cnRAbGlu
dXRyb25peC5kZQAKCRB5KluBy5jwpivSD/0e/X3EiWzkobuBPwRB+/E+Anc/4S4/
lsMxq95qm2fzteKb8nUBUDNOxEtW+/tZv3SfBkt0waa1o3AR8Z70VVvE0lw4JXEb
PoavzUhFWiRTZSDCuv6ANnlid1DH74eDkvZC9ICX95bDQ7XrqtHM6YpCFh3BAesw
eZsYOfXOBgXXgBu9uUWQvYXelvyfMikSygUjQuSlHfGiuqRy1AmbYRFDUJFv4T1d
DLjo2wNIyc+Nml/mitvwm6hHyG0YVd/zwkVD4EfEIp04ZcEgnJABsI/dOAoevjLa
YaGWwnCSJDxb8PR5crfre74DwtypEgWbGg+p3fwbMy4EJ1rvJ7u44cUNafPJPmKs
Juo5CFeeElks3qJ/S/gN5ssVWGb9QcnKgQu5MDTfu3/U21/LnoUg/Wbvrkn2275c
srycG2sc7UH9oV6qxaxyG4l5xfZ8jOVLRB+rTRapv047wZuThETrxIg7Y2f7whf9
vY4mUYx1N3H0EJMGAqlUCKlIV8OWOLSx/NftbYKK+LkIsuDs8HQCD+xPJbSPXdS+
6mVT0So4v5wX00LwP5bnoCmPCzMG2vGuYFFHNuT9QzRzSUQotS5W7blWY7hdpDYh
aKNTbCwKvuL5Ao8bvbOYi+oVhribjafnM0O41ScxIatYg7diemQKuYi7DQ/kysr/
u+KICu9nMU5lZA==
=Lx50
-----END PGP SIGNATURE-----
--=-=-=--

--===============1162981490608131619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1162981490608131619==--
