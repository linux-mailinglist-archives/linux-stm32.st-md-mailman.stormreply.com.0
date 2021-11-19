Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AC456E8F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 13:00:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44FF1C5EC56;
	Fri, 19 Nov 2021 12:00:10 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E4D8C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 12:00:09 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637323208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdbaeAzAumO+KcyRL4vQdqQsFXeSKwO+n/U/wDXKb68=;
 b=fC/WjJk50ipTbXMKrxg28jn/7Zt7B2/a6wn5/g6Xc4HVYOZT1/TvyDtB3epocjikMpidIz
 A06SQ9WG3eo430UpRP7aVXx7bSohKRE918LHhnDNQP/nhPIFOihzpwoz8I5VH1p3T5EH3r
 pieERrVt1lEuHlKmfuL6RX7f4yYFfkEPN7Fy6Kty7aWTpDQCwmoSGMB+9Y1jnn+myMBZvz
 bHXlQkLE3FGa/6GieOw8XHkbq0F0O1KxabpPnbhAwf2c8fkm0xK5GWmzn1Lzk/VbMCbLcQ
 7yPPr7zO5iT4Hu9P83lkaQkYCkj6tKEwiUO0IsZFMNN9/G4m7UaBmKrAmUs/RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637323208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdbaeAzAumO+KcyRL4vQdqQsFXeSKwO+n/U/wDXKb68=;
 b=3MqHbQayFJ0Q/h6Al/wXRWYw0YlHYqmV3mGGiqb8RqOlN/re8Hlcg7bLrRWrLIP1C8ZAXf
 OvUVUDEWY4eu2iCA==
To: Thomas Gleixner <tglx@linutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <87mtm0l5z6.ffs@tglx>
References: <20211119081010.27084-1-kurt@linutronix.de> <87mtm0l5z6.ffs@tglx>
Date: Fri, 19 Nov 2021 13:00:06 +0100
Message-ID: <87y25kwe2h.fsf@kurt>
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Benedikt Spranger <b.spranger@linutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Caclucate clock
 domain crossing error only once
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
Content-Type: multipart/mixed; boundary="===============5898177929499815815=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5898177929499815815==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Fri Nov 19 2021, Thomas Gleixner wrote:
> Kurt,
>
> On Fri, Nov 19 2021 at 09:10, Kurt Kanzenbach wrote:
>
>> The clock domain crossing error (CDC) is calculated at every fetch of Tx or Rx
>> timestamps. It includes a division. Especially on arm32 based systems it is
>> expensive. It also saves the two conditionals.
>
> This does not make sense. What you want to say here is:
>
>   It also requires two conditionals in the hotpath.

Yeah, I realized after sending that the last sentence is bogus.

>
>> Therefore, move the calculation to the PTP initialization code and just use the
>> cached value in the timestamp retrieval functions.
>
> Maybe:
>
>   Add a compensation value cache to struct plat_stmmacenet_data and
>   subtract it unconditionally in the RX/TX functions which spares the
>   conditionals.
>
>   The value is initialized to 0 and if supported calculated in the PTP
>   initialization code.

Sounds better, thanks.

>
> or something to that effect.
>
>> +	/* Calculate the clock domain crossing (CDC) error if necessary */
>> +	priv->plat->cdc_error_adj = 0;
>> +	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
>> +		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) /
>> +			priv->plat->clk_ptp_rate;
>
> Nit. Just let stick it out. We lifted the 80 char limitation some time ago.

Good to know. Will do.

I'll wait for further comments or test results and will resend next week.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmGXkcYTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRB5KluBy5jwpsDQEACEkuky635/SgrRDmmS0IUGEQsftOuX
eRwpnkjAJrezKqQt0xAac7tK+GOi+q4zmg2fKO6Ml+Em/Ni4WnYlMpkVds9fusub
uChqtQUCLlTjtEutCEz5L0ptlcig69ssdvfFB8hP3s+Ac6JuZ1bj4hDk65jG9KjT
SxR1lXylSXfp6exFHC87bBiTuiZXbh/vQFd+/AEBqNOT/oCdqpojuMPh4gWCG5R/
PkwNA3UY00Jb95H6cCR9Mcrze7ZvI8KVdCF/daCOSMW7G3zarT14iRerZ3me0oJe
5HjJ6WJGTee+kC+O5Y6wQ4mHRxCinHP6Fr+3J7MBrdcCRXlBRaGF3/OTtP+AwNAm
BA2cOHUZIjmTbDSXG9ny0I7MzWbJRFFMOXL5cpt14Z2OYyNYVJHiywbnsEqOmzjY
5gBUZDbRkPe7hznje7my1xg7QOtvg1D+I5eHgk3IU6GmRMfEJZlufv03CN+Tzz0q
+RhOvY0sNXBuP5EMcLPkk+SgwEC7jwk4L4NZ01NpJyfgcH+jT05lOUN9nB0qTStx
aZ43LKxosCDDczdgaKX/nJUJkreLnuSgCmEFF4oepCAz3pbwXflV06AKYlNproMP
RqmQlZj7UaSLJh25OkKYygDa/XkmIUIs87nT+Zn8MJfhveJErge3cWMJhYCHN9Ab
bgp2AAMgBbLVgg==
=jKFZ
-----END PGP SIGNATURE-----
--=-=-=--

--===============5898177929499815815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5898177929499815815==--
