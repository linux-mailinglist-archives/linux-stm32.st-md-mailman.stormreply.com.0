Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BC5FFF07
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Oct 2022 14:05:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11368C63325;
	Sun, 16 Oct 2022 12:05:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3005C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Oct 2022 12:05:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id m6so5201827qkm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Oct 2022 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UmI04icaYYevz8erTj5VumVzXOApiqD62eBBl7puraY=;
 b=qtT0dLgoP8gq5FOWhmRjCFCwDD61Tr+gqDYRdhXsTrxyF5nLMFs7IKgjiOMKH5F4l5
 I5CC/lowN/7J/INdR5JiQGFq9Ao8Q/l3LjpSMAyuFBa+MXQuHNgzwfs7YNblXrBwsWXM
 3VG0q3bZTJrP1RIeTbobQQcBZ9/onb+dz8y0rKuALIc16BZ0o4pdtn4+JzogIOz8tHXo
 jgUM/AY1SpsEQ1uQmmTooVqm1cQ6HmsxLwgb/Mt4QhbyUSLDj/Pr8lqY/5tp+8IC0CBa
 PAKCRY8ozzixXu02pJ5azNoQw5CPV5aXjU9mYIw8pbduoe+Xwrk9Lw8xTf6xH3wXNiFX
 Fd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UmI04icaYYevz8erTj5VumVzXOApiqD62eBBl7puraY=;
 b=UD3w2AtqgcKGoq9g1BBqwfjs58W49RRL+nnmNqVEqpyADkqshgK684pkbkqY4ED6Sx
 DMPue6+pMktHCWXo/EYBhyZHcERKXA/ftXLIe4An3ZvovTTMVo6Cs1HO0H+TqHM+a5NR
 G9oT6Uv/jUAqA76YwUQtjQLP1roE4YBwnZKTa9g0Dr1m+iCMdHso97eXh6hl6FNu92W0
 vLKlvoUYBABDqp3daAEoNlpjpRBjKH8xOkoEtiiNx+S55YHxNCCCVKG9DboFRX0g2MxG
 NcFrah8QRwXeXSletkN3xSr29Y41q28+MBB9uj7RwBlYC610/uQSk+zOsj3Zaj73qC0y
 Lidg==
X-Gm-Message-State: ACrzQf0sbhqG7tZaIok6y9/DCUylBtKrxTN4JHe1l7FaNSdzSd/2cUkE
 E6Jk2OTSWEqu5cRIeDx1V16Iug==
X-Google-Smtp-Source: AMsMyM7L06TcpOGp8BEqPcSmNwY3HduQhD2Ygu7LrmAfwqVeAp05tdZ+NzI25BMTnWyukqtxML2mhw==
X-Received: by 2002:a37:4553:0:b0:6cf:4dbd:b5f6 with SMTP id
 s80-20020a374553000000b006cf4dbdb5f6mr4382912qka.339.1665921943627; 
 Sun, 16 Oct 2022 05:05:43 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 q4-20020a05620a2a4400b006ec09d7d357sm7187342qkp.47.2022.10.16.05.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:05:42 -0700 (PDT)
Date: Sun, 16 Oct 2022 08:05:40 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: jic23@kernel.org, lars@metafoo.de, benjamin.gaignard@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Message-ID: <Y0vzlOmFrVCQVXMq@fedora>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] Removing the last of IIO_COUNT (stm32-timer-trigger)
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
Content-Type: multipart/mixed; boundary="===============3136593564696567827=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3136593564696567827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HRMrcOk/7EdR9IuO"
Content-Disposition: inline


--HRMrcOk/7EdR9IuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The drivers/iio/trigger/stm32-timer-trigger.c file remains the last
consumer if the IIO_COUNT type. The IIO_COUNT type was deprecated some
time ago with the introduction of the Counter subsystem. Most of the
previous IIO_COUNT consumers were migrated successfully to the Counter
subsystem, but the stm32-timer-trigger driver remains as the sole module
preventing the final removal of IIO_COUNT.

At the time we deprecated IIO_COUNT, the Counter subsystem was nascent
and lacked some of the functionality we have nowadays such as a
character device interface, timestamping, hardware buffer support, etc.
If I recall correctly, the decision to delay the migration of
stm32-timer-trigger to the Counter subsystem was a lack of some
functionality the Counter subsystem could not provide at the time.

I hoping someone can evaluate stm32-timer-trigger to see if we are able
transition now to the Counter subsystem, or if that necessary
functionality is still missing today. Even if it turns out that we are
unable to migrate, it'll be useful to know what's left to implement in
the Counter subsystem to support stm32-timer-trigger or similar devices
in the future.

Thanks,

William Breathitt Gray

--HRMrcOk/7EdR9IuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY0vzlAAKCRC1SFbKvhIj
KzBaAP0TAsZHUhqetvOPlAMcDxL+BLNrmOVVk2noaEurAxJBBAEAg3wWG3/TM4jB
pZMQoTnLR84Z69Y4AoEgwfVbXnhPNwA=
=j1dt
-----END PGP SIGNATURE-----

--HRMrcOk/7EdR9IuO--

--===============3136593564696567827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3136593564696567827==--
