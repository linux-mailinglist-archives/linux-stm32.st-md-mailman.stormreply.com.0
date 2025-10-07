Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87418BC08D7
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Oct 2025 10:08:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF296C3F938;
	Tue,  7 Oct 2025 08:08:00 +0000 (UTC)
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F13C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Oct 2025 08:07:59 +0000 (UTC)
Received: from ripper.localnet
 (p200300C597021AE00000000000000c00.dip0.t-ipconnect.de
 [IPv6:2003:c5:9702:1ae0::c00])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.simonwunderlich.de (Postfix) with ESMTPSA id DFAA9FA12C;
 Tue,  7 Oct 2025 10:07:55 +0200 (CEST)
From: Sven Eckelmann <se@simonwunderlich.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Oct 2025 10:07:52 +0200
Message-ID: <2249324.Mh6RI2rZIc@ripper>
In-Reply-To: <175978385977.561952.12777844195936444721.robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
 <175978385977.561952.12777844195936444721.robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] Re: [PATCH mt76 v2 2/3] dt-bindings: net: wireless:
 mt76: introduce backoff limit properties
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
Content-Type: multipart/mixed; boundary="===============4758179223776215618=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4758179223776215618==
Content-Type: multipart/signed; boundary="nextPart3717359.R56niFO833";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3717359.R56niFO833
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <se@simonwunderlich.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Oct 2025 10:07:52 +0200
Message-ID: <2249324.Mh6RI2rZIc@ripper>
MIME-Version: 1.0

On Monday, 6 October 2025 22:53:36 CEST Rob Herring (Arm) wrote:
> 
> On Fri, 26 Sep 2025 12:04:53 +0200, Sven Eckelmann (Plasma Cloud) wrote:
> > Introduce path backoff limit properties in mt76 binding in order to specify
> > beamforming and non-beamforming backoff limits for 802.11n/ac/ax.
> > 
> > Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> > ---
> >  .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Though I know nothing about this. Is there any reason why this is 
> all specific to mt76 rather than being common? Perhaps these settings 
> are all just part of the opaque "calibration data" in the QCom case?

Yes, everyone handles it differently and has different requirement for the 
actual provided data. Qcom has the calibration data, pre-calibration data, 
calibration files and pre-calibration files (which also needs variants for 
different devices or regions). But the actual interpretation of this "opaque" 
blob is secret and handled directly by their firmware. Don't let me get 
started with the (sometimes) embedded regdb in their calibration data.

Regards,
	Sven
--nextPart3717359.R56niFO833
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaOTKWAAKCRBND3cr0xT1
y1P6AQCJRqHBtM3JW0S3r67quInXoomehh1RARYb5qW8xjcSWgEAkGt4kjlOUGCC
mOCuYzAeIPd9MfFHxHxtcsvjodrRXQI=
=FPF3
-----END PGP SIGNATURE-----

--nextPart3717359.R56niFO833--




--===============4758179223776215618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4758179223776215618==--



