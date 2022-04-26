Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C920750FFCE
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 15:59:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75374C6046D;
	Tue, 26 Apr 2022 13:59:00 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A47DC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 13:58:59 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1650981538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2iZVgTNBSgaeoRbSzUYC9JbtTRd+xjYUfhrrkl8rhw=;
 b=O/ZgmagFIttM/Oj0vNa1VQ1CCLIjqaWKHzuEny15FQuDDOgW4b70p7rZhsXEgtnUckXWjj
 1KpDVu0jLM9629gMOkygcFVSUx7kHR8N7E6hDovfHzOEoM3s2Odvw3IWqzWqGfZwwQrkvY
 8DjK/TgMO+BU0xTgVOvackORvTWWqMI3EnR0noqUk/5QVe5e1F9iDrpaeHdqSm1vOxhJJS
 r7jFdfosahjEQ6yxFlUCDo9VhRAWQjFGCU9SGHu/GblBeGktcw8zVO5XqsIPPAv7NQAg0Y
 7iYVCAwXWTREshV82/JcKcVdu2VXlirSA6ZZz6cBq/Fv3mvxY2tj5WT5z6AyuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1650981538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2iZVgTNBSgaeoRbSzUYC9JbtTRd+xjYUfhrrkl8rhw=;
 b=CsPZZMnCYu/3XbqW8wNsn2dnOrwdU7n6otYY7wFkbPKv68VZIvA/28JBS+SbXOUVBmzHtU
 CJvZ18kAtTHeS6Ag==
To: Tan Tee Min <tee.min.tan@linux.intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael
 Sit Wei Hong <michael.wei.hong.sit@intel.com>, Xiaoliang Yang
 <xiaoliang.yang_1@nxp.com>, Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Ling Pei Lee
 <pei.lee.ling@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20220426074531.4115683-1-tee.min.tan@linux.intel.com>
References: <20220426074531.4115683-1-tee.min.tan@linux.intel.com>
Date: Tue, 26 Apr 2022 15:58:56 +0200
Message-ID: <8735i0ndy7.fsf@kurt>
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Ong@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: disable Split Header
 (SPH) for Intel platforms
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
Content-Type: multipart/mixed; boundary="===============8461587106348531814=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8461587106348531814==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi,

On Tue Apr 26 2022, Tan Tee Min wrote:
> Based on DesignWare Ethernet QoS datasheet, we are seeing the limitation
> of Split Header (SPH) feature is not supported for Ipv4 fragmented packet.
> This SPH limitation will cause ping failure when the packets size exceed
> the MTU size. For example, the issue happens once the basic ping packet
> size is larger than the configured MTU size and the data is lost inside
> the fragmented packet, replaced by zeros/corrupted values, and leads to
> ping fail.
>
> So, disable the Split Header for Intel platforms.

Does this issue only apply on Intel platforms?

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmJn+qATHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgmn6D/9qeUHNLrQQtVKYURUbC/oNztnlmc3Z
hwrp1SHvXu96xuyNmylbZEo2zADbG258zdU8ZD3NEBdHFRA4aL6f2B239dSyry1n
xDi1COlTs/ve7G08MZalCchNpyrgPw3JR2PP4bSWIeqbP4C13C7dZEtsPjJs8tGH
DxelFGu0xyfDxYpkS93ebV+cMvmwyhHDHHX3mbjP6Yj7V+g8XCS7ds22k1VLP5F0
CURBIhbl+f0XqFDc51M6wnUbmfD9nSGSuximRG1Exog1E/wrfadUOObHFFaQLBWr
EcJdw0NEi/XnyK0G4xiP8hr1lfQmclpHD8aEMW9EprErePDqJQL596GkI3R4Ku5G
IqkAieR62prU/Yopidw5M8EtH7FusL0zPsDXWp8jylqDUruN4ltbD1X6Cr4l9dKp
xtXDFL73nj8/AYFKrTlrYc8isMnTxumkR6yu+N9jTgWLkAY17IJ0Bm80xKafqjAe
xivpxueX2+/ZjnP4kYR1FzVC7CQTx81h1Cxjj9YFGWDTLlQ29vVvtV7a09zyGUOc
qBlAYfPUHa0AQIEeDCQAJVvif005cnP87maoYPkU45oeL3GBS7Uykd/0Hfr/wpFw
dZbLJnewfK848KvNsajR7omzWE8T34ApYJRIYIuJtfDuBBZhB/y/CgNgp1wi3LdL
D7+1mOI7VgmBoQ==
=YG8s
-----END PGP SIGNATURE-----
--=-=-=--

--===============8461587106348531814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8461587106348531814==--
