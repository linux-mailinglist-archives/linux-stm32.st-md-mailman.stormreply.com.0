Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71CD88D6
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2019 08:59:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 392C3C36B0B;
	Wed, 16 Oct 2019 06:59:51 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC17C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 06:59:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p14so26607242wro.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=diX73upTDH+Le9kcw7/XCVjA0EDthPi0kI1j7qCDE7U=;
 b=D45DQTXRZHpHqmNV1ZHx/1jV+zI72KyaocnL5qI5Bhvrm4gLEuEFtVXPXUYWHUfG35
 fLqAhBs2BjHNKQ05KN9EFlH1euiZStEoZRRO7IMq2A9pM2HV115cXo36Eb4MAh9aOKTu
 rbYX09lp4sO4fuO/YdzCEurFqJQduJanR1vYdAVt4095ahIb3hjimbmyLZJyo/QPn0V5
 PQ1E02E0nlbssAYBvHNoZHIu2+ahFhCHowIj/ClyCk2I2DI5+URuXjr7+bHBt1Jl7BN5
 Y1Yex9kIG9e0r9el3lhHv5C9AJ8x9RIGOQARUt1X7CSZGRdtqFTvMuBsWMSVKiHMjZhy
 VnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=diX73upTDH+Le9kcw7/XCVjA0EDthPi0kI1j7qCDE7U=;
 b=div+USB+wPVVjrmoyPjlm0YpZk9e7azP4Z4l+8nWbHCTO9E5PRMIExtO97tDG5jBtL
 fNf7WJsBALV7es4/F+Bn/pJx8OlWryZDJy5j5cJ50RADO6B7f4UGovjJT1h9m5wBt+8J
 0qNYZsF8xL2NAeAUUimttItRMdeC/5dvXhZP2mHf4HfHAsp9Q3k6r+ee8Gx0vkhLukBG
 uDbFMM6GHdbJlY1goxMYKFnhcabhfMl3TUNr8k6S1dK8OjBZM/dHm4OAz02R+/ZtSc4w
 qAL7F1ixfmd3+eCF1FjJ2sf2dmVMcL5yKlRBLy00CA1yDXoAdoLp/LcBPvWXKlINc2Tc
 BJTg==
X-Gm-Message-State: APjAAAXh1Eg2P9/+VH1TvPjyxn8KBPsJRorLjGvXjrcpiIwfo7tX7ivF
 ksVSLMUAi6Xnh4AWBnH49Ps=
X-Google-Smtp-Source: APXvYqzw7i7UVTV7xJwRgPRf9mHmCqNLbvW5Tm4FhWaG2fTixmFPnl/QWZqe/Xpc2GrgzM2xBXPoUg==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr1308017wrr.304.1571209189718; 
 Tue, 15 Oct 2019 23:59:49 -0700 (PDT)
Received: from localhost ([46.91.226.206])
 by smtp.gmail.com with ESMTPSA id k24sm6060907wmi.1.2019.10.15.23.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 23:59:47 -0700 (PDT)
Date: Wed, 16 Oct 2019 08:59:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191016065945.GA1296874@ulmo>
References: <1570193633-6600-1-git-send-email-fabrice.gasnier@st.com>
 <1570193633-6600-2-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1570193633-6600-2-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 u.kleine-koenig@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: pwm-stm32: document
 pinctrl sleep state
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
Content-Type: multipart/mixed; boundary="===============0668809405844588212=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0668809405844588212==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 02:53:51PM +0200, Fabrice Gasnier wrote:
> Add documentation for pinctrl sleep state that can be used by
> STM32 timers PWM.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-stm32.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2mv98ACgkQ3SOs138+
s6HF3BAAmYT8qlTIl02DuYkZiIEEQt9hsB26Q0G5lb9hNoOoKx6lZQ+fH6rl2YGG
4qNTgV7tO6d2L3ip18Khcwjix/qAMIquiQS7X98cRjYA72kq3zwY5hj6pRxwF0Z5
qdY0aTeeN2YpT9rhOR0vjmMfVGDgds9wfCLZXvkYGJ1eIHlrWD7MTDBcQeResxLk
IGpnF6avlEnIlnaVKhUExslBOfivCtPho2GT8mXRQwR2UEjT2hQwJf+Sx98retQ9
C9rrKMP900bMgeyBzQ0AZbZk1/U6wW1yeJaIITR0wJFLN+Gg+FMS+lb/fhGYMKwu
9uQUNAYK03J0FUEZp8Esp1W36ua2XVlmEd+7meqo1OQXBG3uVPpIwTJrBmbPON7s
Q5wHH96B8zjwGdwaVXi/opEDrRezm5c3Ek2bE5cuKfE1grspT0TIqrxmfKnJjzEY
p12kGLnyp7UCaRV8EpUlVDo74koFoMtsCJMNB+PkeZfJEcpoAE1P+gJtt7mWzrXa
dH/ZR6ezffrGbHvH9xKqWLoYSBv1r6PbAiNTJLFCzfWUGBujwQut3bTMNJQoEC4Y
cYPLZnLDnw4Sv7tRoF3nlz3zI5RmQy6qQ0ycz/0CXNv1+W5LVgBa1izwHJ5g1Civ
+vcMdBtQEl6PC4APpHq3jfKFRnO/LOfYRuh8YFl0IwUa9dURl2Q=
=xIm6
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============0668809405844588212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0668809405844588212==--
