Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D196346FDE4
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 10:35:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 720B2C5F1E7;
	Fri, 10 Dec 2021 09:35:57 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 654E2C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 09:35:56 +0000 (UTC)
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639128955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WBYC6INRj8oAA6ylOY7yTpCGQBsmhCEkH4H9/SmuxZY=;
 b=rrRR1owdCdOZDPHB8ylGip3CoJNyq1v1ksRu15cNU9meoa/aJTgQ28bHDgJ5qD2Z6PbYA3
 GVaNasRjnz6kHOaWCYxTu9veTNDvtqiUM8To0r2ug44gKPjpo3IhqvU99ByDbKZSnypdQz
 YC3QGoqsiH6qoXrGzcrjrJ3N4vGSJRIDTK+P/O4Bo9iLEc8Yzs8fWeQy7ZhUCZTTVI7bSA
 E9Q2Am/63kRhUt8Qk6uuyNrSCaLDjCOOzf+7OdH9y4w708fWXlImDNZmtaJ5+hR/B/cOFR
 uiHDEp2Tgy4UDaHML0C760iETnUaG/t+dfa/RVkxMWJ5RyZCSnX14VaEVNLM1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639128955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WBYC6INRj8oAA6ylOY7yTpCGQBsmhCEkH4H9/SmuxZY=;
 b=JKa3Ohp4lxLVvxXIDyehXNOqJTZR8GOVgHA3+FqUTWTL8oB4lxsSAXYX7P6ApEcZrmDkIz
 hYMSrdMebd4akiBg==
To: Ong Boon Leong <boon.leong.ong@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, alexandre.torgue@foss.st.com
In-Reply-To: <20211209151631.138326-3-boon.leong.ong@intel.com>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
 <20211209151631.138326-3-boon.leong.ong@intel.com>
Date: Fri, 10 Dec 2021 10:35:54 +0100
Message-ID: <87ilvwzts5.fsf@kurt>
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
Content-Type: multipart/mixed; boundary="===============8847585704313548949=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8847585704313548949==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi BL,

On Thu Dec 09 2021, Ong Boon Leong wrote:
> This patch adds basic support for EtherType RX frame steering for
> LLDP and PTP using the hardware offload capabilities.

Maybe add an example here for users?

|tc filter add dev eno1 parent ffff: protocol 0x88f7 flower hw_tc 4
|tc filter add dev eno1 parent ffff: protocol 0x88cc flower hw_tc 4

>
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

Something is not quite correct. The use of the etype variable generates
new warnings. For instance:

|drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:768:25: warning: restricted __be16 degrades to integer
|drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:768:25: warning: restricted __be16 degrades to integer
|drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:817:22: warning: restricted __be16 degrades to integer
|drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:817:22: warning: restricted __be16 degrades to integer

However, the steering works as expected. Thanks!

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCgA8FiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGzH3oeHGt1cnQua2Fu
emVuYmFjaEBsaW51dHJvbml4LmRlAAoJEHkqW4HLmPCmtiEP/2Bi/cOq//6urSTu
9iDsESTq1pnJFcfbykRsCaonY7bjzFZN/suxxUC4IZom/4kzhE9lJSPxaQUo+xqD
/MLbehxqfA6VZ1HWWngVTxKcUhUhNdkw9R6zSkHXPdbTe6D3Q/ml/PoYMrNczR1W
68u7Tl8khf6IQWRvZAinAvsgTSSkr4gCvmkcSDVCZ2tf9TvitdQILGr9DkCyK7mk
8bXFWPFRB4Hmd2Mf09uGagpQxrRcqaIjf4AGgI1PedXFWEJ89mUeX+Czr4yM0tYb
52j8QxTQpqAiJ9QXvATIY/wZqwalHc86EvFwZCAALpv7rPw96rvUrFGSsIqxMn0a
NWPVHqvnr/rXPSA+3aiqrXFhUsKdVSk7/azOsElXcwPEkLH1G74ORYSp/gWIu/7u
kNUhKHaftCvFHxZ9IqQySzkjl95dfomsbwuhmhJ1mxtSKiV/npcYsz6JwHxNn/y5
BNBjmjVJ5Jj9bSgBlIRT7WlghNjrWWghPjRlt2vulnqMDeDfZeCCCgbyaAmwJn/K
kVXIuByOtNTAfomUpv5dITVPCIBAreozXDAr4YGUF7u21ZWiCyXKKImNJXRt66IM
3bv4sK05YdleYhcL/z6IaKzzKr5yH3RRTcDWqeRUxsWomjpmJ1zVE59vr+5zQZKs
2j/rBVvZGry982hd7ll9/Uq3FkFC
=6esP
-----END PGP SIGNATURE-----
--=-=-=--

--===============8847585704313548949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8847585704313548949==--
