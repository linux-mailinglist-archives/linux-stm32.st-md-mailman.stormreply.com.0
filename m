Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l57BH7FjT2ojfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6572EA07
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linaro.org header.s=google header.b=jorURXDX;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linaro.org (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B3B1C8F289;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 829DAC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:54:53 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so1295377a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 05:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783515293; x=1784120093;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
 b=jorURXDXG9KfCJAcz/mWbDb8SK+/OMuPlX0YlUaa7uOkZmA51sA1fi9hioAqaNMZPz
 h7kfJLR2TpQ9MJKsxEP4VfgjBPb3XevyivpPHhHGYAkxaDi7uCKcpe8edyPSzijR2UKn
 ZxtstkNnSGEPMChTMtrRT6zyGd3NQD1Xi9kzufAvMKkNn7PTXBI6LzqQKeQPCBKCi3Ej
 bF+VWH1jYRzruNgukzej8wN6zILb3yiCCYH6kuDeyPpHwFtJO0++qMrD1KMGRLFr80yQ
 w85ZBE0zPbYlbBFBWO9zc6+w/pVNczPZDyR7HqasvjyPeSR9b9k3/1KSI+QmILQj/XY+
 PfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783515293; x=1784120093;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
 b=FKfyFaFKlhVVwfI8X6jB554v5cvWJp2yfDrnefmuS1izl4LQu06L37uJoaRGpYHBB5
 liAmQksO5fewRBYRewTrdDDBe5sZ3b7sNSMHiR5ul0e3EJdxryz0EKMOz9WJRpncmNEu
 tM4aIJ7AH/TpckiiDS/UpUB1YLipZR8vea79K76amYX61kEDKPrmsZ4Pr2plf+SPvoGc
 +8OeZvod/XCFz42qYF3KPyoAtwOLGqtbaTxD53z4PTJ7TZLdb7s2bHZ80lKXmfkzwpPb
 oGYh0nGbkyInPbeN+bYgs9tH5LYUZD254KrXQ6ZA4HQI+8V12I3PnkTMCCFFRGJzT7C1
 ZOkQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp+MIcd531kHxIGa7VRATLuL2fGWs/OAbQSg/l8FeQeldxyORxtPuipFVV4CEzrbAc0G3iHHd3VzICxYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBJOJW/J2uJIS7/XawP2b8Fx2HXpZWDEhtgTUC1UQ3BGaQMsfU
 /Gjy7jrdQbUmxRrzSkBe5d8qZuf9HPDuE4jxM+BShwg+LT9kPYS9GEpYECEd0EufibU=
X-Gm-Gg: AfdE7clltcR+dXNemBNIrIVIDwygL9bvV9yfi9WFgKHQSKJiWFFb3jwulxc19N3iGB9
 oc1CC5TWXdymlqh08zeHAaIob+ZPsdQZdyOfHNqiAoadXDmPLfFYLIlsDZJ4plK9uubjh8rlDue
 pI7DDYCp9EiLItW/RifZUBV1Ks8l4v1+A95LObRjicPlUYoGC8Vjl1D3R9yD1I5Tkj35fhZqKhp
 /1N8lzuGNxK6hp5uhBpCYd0VxPnYzvIM+7cagDPqSnHdtDKj/1iX/3VNqq/jTyPfo8cPeTumfEo
 CTMfEi9kMLs9q1NNJ5cfA9z9X7hJDrMflJAaXwxUSRuwFcS2g+XnO+iJkcqxF9+640OJIs65PDv
 2qRM9xaK3Q6aAlK+Cj4qpEFfk5UutRLFGrPKb0SmqMwQ1kkcGGSjp2sFqNU6d9A51OY4+3G4+OF
 sf5GWljTuv0Bd7jA12ccI=
X-Received: by 2002:a05:6402:1906:b0:698:b60b:aac2 with SMTP id
 4fb4d7f45d1cf-69ab4453d30mr1054344a12.4.1783515292855; 
 Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69aa613d4e2sm2000319a12.24.2026.07.08.05.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <4a5a09fd68fe45939bdcec4a3c5a781d664eb34c.camel@linaro.org>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
 <u.kleine-koenig@baylibre.com>
Date: Wed, 08 Jul 2026 13:55:06 +0100
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Fred Treven <fred.treven@cirrus.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-omap@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Andreas Kemnade <andreas@kemnade.info>,
 Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>, mfd@lists.linux.dev,
 linux-sound@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Bright <ben.bright@cirrus.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/23] mfd: Use named initializers for
 arrays of i2c_device_id
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:imx@lists.linux.dev,m:tony@atomide.com,m:fred.treven@cirrus.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-omap@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:lee@kernel.org,m:krzk@kernel.org,m:cw00.choi@samsung.com,m:andreas@kemnade.info,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mfd@lists.linux.dev,m:linux-sound@vger.kernel.org,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:jogletre@opensource.cirrus.com,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:andreas.werner@men.de,m:patches@opensource.cirrus.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:ben.bright@cirrus.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,atomide.com,cirrus.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,kernel.org,samsung.com,kemnade.info,opensource.cirrus.com,analog.com,lists.infradead.org,diasemi.com,men.de];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AE6572EA07

T24gV2VkLCAyMDI2LTA3LTA4IGF0IDEzOjE1ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhl
IENhcGFibGUgSHViKSB3cm90ZToKPiBXaGlsZSBiZWluZyBsZXNzIGNvbXBhY3QsIHVzaW5nIG5h
bWVkIGluaXRpYWxpemVycyBhbGxvd3MgdG8gbW9yZSBlYXNpbHkKPiBzZWUgd2hpY2ggbWVtYmVy
cyBvZiB0aGUgc3RydWN0cyBhcmUgYXNzaWduZWQgd2hpY2ggdmFsdWUgd2l0aG91dCBoYXZpbmcK
PiB0byBsb29rdXAgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBzdHJ1Y3QuIEFuZCBpdCdzIGFsc28g
bW9yZSByb2J1c3QKPiBhZ2FpbnN0IGNoYW5nZXMgdG8gdGhlIHN0cnVjdCBkZWZpbml0aW9uLgo+
IAo+IFRoZSBtZW50aW9uZWQgcm9idXN0bmVzcyBpcyByZWxldmFudCBmb3IgYSBwbGFubmVkIGNo
YW5nZSB0byBzdHJ1Y3QKPiBpMmNfZGV2aWNlX2lkIHRoYXQgcmVwbGFjZXMgLmRyaXZlcl9kYXRh
IGJ5IGFuIGFub255bW91cyB1bmlvbi4KPiAKPiBUaGlzIHBhdGNoIGRvZXNuJ3QgbW9kaWZ5IHRo
ZSBjb21waWxlZCBhcnJheXMsIG9ubHkgdGhlaXIgcmVwcmVzZW50YXRpb24KPiBpbiBzb3VyY2Ug
Zm9ybSBiZW5lZml0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhl
IENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KPiDCoGRy
aXZlcnMvbWZkL21heDc3NzU5LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQoKUmV2aWV3
ZWQtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+ICMgZm9yIE1h
eGltIE1BWDc3NzU5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
