Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3446FE7F
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 11:10:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68AA6C5F1EA;
	Fri, 10 Dec 2021 10:10:07 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BFFEC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 10:10:06 +0000 (UTC)
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639131005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9McyQ9MuBise9kEaMK0iwGANbPMdoM0lgD2I/oaTA0=;
 b=dX7uX6vvv0AIy4FbDrtO4i+rH42bjZuDHgKsPc0PdhZYCvClw6EHqHxJLtjrIZCeeM1FVh
 3qidyeiWPLC3/+bOsS53d0MqeTQT8D5JAb9/4uwpqJ2alWDii7Opbnsjl7bINAoknp9tMb
 qnXwLpu+kb3WAWdXrySeMG1DbhtlDH50xWga9Nmq2e1zn6EcC/tZaYnxGK9W7WdcB3klqx
 X4gq4ysWWYIcGJ780jSJ5MAiVXI4WLNwnctBXE8Yu2isFOd/rHFJpQEpsCNR0s/+OuQesH
 riyTOtiSD9c1v+HJrKq9OmDo0PMBdpH+VqYeJ+0M3fifAUEJeDb0tiJ2kTAitQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639131005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9McyQ9MuBise9kEaMK0iwGANbPMdoM0lgD2I/oaTA0=;
 b=mjPTFo3Zshvd6jHmVWuzrzrYY+GnhPATApuAxG4mkAJkq/QC9j5xhzJREmYgCqZ4Nlf/yQ
 gb3hswro03CQhiBA==
To: Ong Boon Leong <boon.leong.ong@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com
In-Reply-To: <20211209151631.138326-3-boon.leong.ong@intel.com>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
 <20211209151631.138326-3-boon.leong.ong@intel.com>
Date: Fri, 10 Dec 2021 11:10:04 +0100
Message-ID: <87fsr0zs77.fsf@kurt>
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: add tc flower
 filter for EtherType matching
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
Content-Type: multipart/mixed; boundary="===============4630170300082994076=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4630170300082994076==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Dec 09 2021, Ong Boon Leong wrote:
> This patch adds basic support for EtherType RX frame steering for
> LLDP and PTP using the hardware offload capabilities.
>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

[snip]

> +	if (match.mask->n_proto) {
> +		__be16 etype =3D ntohs(match.key->n_proto);

n_proto is be16. The ntohs() call will produce an u16.

Delta patch below.

Thanks,
Kurt

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/eth=
ernet/stmicro/stmmac/stmmac.h
index 35ff7c835018..d64e42308eb6 100644
=2D-- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -182,7 +182,7 @@ enum stmmac_rfs_type {
=20
 struct stmmac_rfs_entry {
        unsigned long cookie;
=2D       __be16 etype;
+       u16 etype;
        int in_use;
        int type;
        int idx;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/=
ethernet/stmicro/stmmac/stmmac_tc.c
index cb7400943bb0..afa918185cf7 100644
=2D-- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -759,7 +759,7 @@ static int tc_add_ethtype_flow(struct stmmac_priv *priv,
        flow_rule_match_basic(rule, &match);
=20
        if (match.mask->n_proto) {
=2D               __be16 etype =3D ntohs(match.key->n_proto);
+               u16 etype =3D ntohs(match.key->n_proto);
=20
                if (match.mask->n_proto !=3D ETHER_TYPE_FULL_MASK) {
                        netdev_err(priv->dev, "Only full mask is supported =
for EthType filter");

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCgA8FiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGzJ3weHGt1cnQua2Fu
emVuYmFjaEBsaW51dHJvbml4LmRlAAoJEHkqW4HLmPCm0HgQAKCym+iwmw9dZxIj
NTjjYl/OasE0mS+A7hCx12KB5kxw0zgSq1gzjXcuIfqHovQjV3ObFc6WPzNG+y7M
IEF0jrNJx78dMWzBKLHGmzhR88r8eG/o5BhLUVjMqMbzCVD/Xj5z/dhe8BzPLeS2
w8hn/EXnYOiWzm4gInKm3T26y0cazH+XwV34dYQVkduAJwFLNhlaFRf9SQ1A7eOh
GQJ6biGNRCND296ZtJ/qGkUVd0N5lqIdHe7TOYHOTwSlnUqKwAblRWM3Ck505VMT
RbGOPTxGybADkNivRebRkhz0wwf6DzVprHD6QnVurLJg7MM3NP9yIHMWE0wA1bZA
XdJyP448rKMahd6uTVmJP7WAAV/pHDGVg+BxZlewOCAvwN4cxbmgmTvpSt/Fvrpf
P8NgTqMY5pvn1AfsC8O+aqm2N68kxefEyw24Tpbpc1ZSMXr+e5vEkX3hZx4VAPzc
+HyHSBuLnsJmSEX5s7fuFQqBVeQTGJ62oDEP4lBk6m30hswDREXobklConGitrqH
IV6LHimyJTpONjb6WjVZqv5apkGq5JQQadrVE32HU2L1Q6IgAFYWyhhuAIRKPWla
550X0dYUo9+oaVIHjQgKdmxdwqcnHr1nk+0J2rUPM3JXC8+Jtglbp6KBiEjyvXPv
USbIhJuAdOokNaFzvY+F6vTwRY3G
=44Bn
-----END PGP SIGNATURE-----
--=-=-=--

--===============4630170300082994076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4630170300082994076==--
