Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E478275B4
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:48:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 612F8C6DD66;
	Mon,  8 Jan 2024 16:48:16 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18104C6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:48:15 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-7cdef012c0eso532377241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704732494; x=1705337294;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TxF270K+sexJ/eLc9N8yPVgplaxBJJ/k6+fU5vbUs84=;
 b=pQbs5Ebj6WKsUTQFPg4z3ib2XmXHPxcReF5nJnSaKIXYfkSjZeOyfZNEDI1lf8fP4W
 IMq3NpNVQIusj2TIv5dHaZ5GIRuQifK1/gs41Fxf4j1Uix7zBD++0G6ldx0YyaqWoU1l
 MrlA2U7aS2yLYI3Hpi8R49udP39nES8TQaYUOf7OhLQ0J2OTDr0xTgTBO8STH1CXqdhf
 8kNVDTzB90FjRJZCWfhdq+8aamz92x94f3O66yC8KrFPet8ihQPyOgAL8DuESftaXVIa
 E1BXI1Gm/t1rUtNjifhAa1w260nCbssWw/xSZBxSkHqnkZFVBREhSC1PYXfnxFP1L1du
 cwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704732494; x=1705337294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxF270K+sexJ/eLc9N8yPVgplaxBJJ/k6+fU5vbUs84=;
 b=fi+kThLb9gsWePDfHgdcpw90V2m0hpr1G6eCRNr/ZK8lhZl/mUinDD/ZpjlLNUG4hq
 SQkWnkqOQQH0HRd6gjgV6DCngQ8pzx7Q3AD1oBSoHLX5DDrerlqiO9qm/CHkPtYnV0wm
 8v8ZzJMOcBKoap99g3p2Jh8KXJU//SjgGVe5LKYtyx88BluX7jXNOV0SWR1HRXpRz6+M
 Fr5pFalMEeFi5z6gG/jpF3ZZAIwl7T7ZQzsqwEZbRm5ZsTDGBXEsSqokRuuutcv5ZmDT
 65Pfqv2PyO9VRu6XW2S6JLcPIId4J6f9frb50QIBSvUWoyPEMEkdmIO1ZMcsJGYhAqsD
 mrGw==
X-Gm-Message-State: AOJu0YxY+4o9zP0kFwXMoAfX8hwbvqJbA4KjZl/Jb4u1QqVRt0mzwyHK
 me8aucvJYPV34DoxbxHnTd731sHSHXorLg==
X-Google-Smtp-Source: AGHT+IFnw3iDIzHmdSbsEwn7wuu3C3WEjdB3EjbZeioFoqdMp0jSYH5m3FcMGDqp4NpvTo1r11M+/A==
X-Received: by 2002:ac5:cbc9:0:b0:4b7:209d:4b2e with SMTP id
 h9-20020ac5cbc9000000b004b7209d4b2emr1311471vkn.22.1704732493947; 
 Mon, 08 Jan 2024 08:48:13 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 k11-20020a056122210b00b004b723e0ea8fsm27109vkd.9.2024.01.08.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:48:13 -0800 (PST)
Date: Mon, 8 Jan 2024 16:48:11 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwnSwh2oFby+0p0@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-6-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 05/10] counter: stm32-timer-cnt: add
 counter prescaler extension
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
Content-Type: multipart/mixed; boundary="===============3027166651834164390=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3027166651834164390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4h1HqCgsu7cQ8iVi"
Content-Disposition: inline


--4h1HqCgsu7cQ8iVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:21PM +0100, Fabrice Gasnier wrote:
> There's a prescaler in between the selected input signal used for
> counting (CK_PSC), and the counter input (CK_CNT).
> So add the "prescaler" extension to the counter.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - New patch split from "counter: stm32-timer-cnt: introduce clock signal"

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--4h1HqCgsu7cQ8iVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwnSwAKCRC1SFbKvhIj
K9RaAP9IqRLPnpdLYchE7O5E/UqKIxSSeo6jMBIU80OM+m3J/AD9Gok/LU2WQLEP
+9wSu6cs8f5l8Q6eWhM+ZMzI5V42bQQ=
=OgJB
-----END PGP SIGNATURE-----

--4h1HqCgsu7cQ8iVi--

--===============3027166651834164390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3027166651834164390==--
