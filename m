Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 869196B9A9F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 17:05:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34150C65E60;
	Tue, 14 Mar 2023 16:05:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A97AC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678809910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
 b=i9C0M4/h38tzzE9gMyYjdwpnlGfJoZo08gwKS9OAv1eKsRw1Xq6EN9e4A3ArVUkahJSykm
 EGUTwFVA/MHFNTP5eGYgSzrO65SKxwXbybYqfn2/Vs2h5VblJjglyUknBSAoEQdqyJckEH
 W3VC4x/fonweJHkADcbQHofQ6pqvvIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-U5zbeomNNke1m2mh1R2e1g-1; Tue, 14 Mar 2023 12:05:08 -0400
X-MC-Unique: U5zbeomNNke1m2mh1R2e1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5684607wmb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678809907;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
 b=MZ5cMycevYmrMt7KydYpzrZfVADJLmGlFBQNb/11WnH7PpeyDagBSrFIpoi9A/GJWg
 +i84EYrSdPBHJY3LD6xt6Q1C10YdrNgsy/wESN3QZyHBZ4O1Fc/40WgsP0ExbUOr7xT3
 7HTEub+GhF5c43j01YoT5bHXCwJnMsg8fazZcCKudk/MqSc651/TuhzgUF21uMohZ5BU
 7L13kFF/VuZPVDoXYXiE+F+bdp+SOQZj5vFJdSq6Rd6dTTkg3Kive+wPjJ/WwHoEw8Jr
 u54tf28iGGi1HXPb8xM36R0nDsEBYYFsEuriNgS9RBaoYKPnnS5Sorb2VbtCRH2wV/Vy
 BORg==
X-Gm-Message-State: AO0yUKWsiuY1VVg863V+s5JsB+YbP306FL9mEmxYSdb4UL2h3yi0lo6n
 eBAQ1IEF6UidmUqsQ3SihytKN4Y2GTQ2YGJFYASe7ByVc7qJ6UvfID/K0rNOWR7m4fwqKTchUnE
 UCRWZ0i82wRizFCs7pQdmQB2jkRi//E5wK7YUtE56
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id
 n17-20020a05600c4f9100b003ed2c929f4fmr2497191wmq.10.1678809907241; 
 Tue, 14 Mar 2023 09:05:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9xSEo7gCICSkLAf2zsB02OWfCkjdy+yaejHZtyJwi5t5dZZAehVmN38jPmBozEi8lyKugTiQ==
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id
 n17-20020a05600c4f9100b003ed2c929f4fmr2497152wmq.10.1678809906889; 
 Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b003ed2987690dsm3148966wmi.26.2023.03.14.09.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g?=
 <u.kleine-koenig@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Tomi
 Valkeinen <tomba@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
Date: Tue, 14 Mar 2023 17:05:04 +0100
Message-ID: <87ilf3l3nz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from
	dependencies
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

UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4gd3JpdGVzOgoKPiBPbiBGciwg
MjAyMi0xMi0wOSBhdCAyMzowNSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IFNv
bWUgb2YgdGhlc2UgZGVwZW5kZW5jaWVzIHVzZWQgdG8gYmUgc2Vuc2libGUgd2hlbiBvbmx5IGEg
c21hbGwgcGFydCBvZgo+PiB0aGUgcGxhdGZvcm1zIHN1cHBvcnRlZCBieSBBUkNIPWFybSBjb3Vs
ZCBiZSBjb21waWxlZCB0b2dldGhlciBpbiBhCj4+IHNpbmdsZSBrZXJuZWwgaW1hZ2UuIE5vd2Fk
YXlzIEFSQ0hfTVVMVElQTEFURk9STSBpcyBvbmx5IHVzZWQgYXMgYSBndWFyZAo+PiBmb3Iga2Vy
bmVsIG9wdGlvbnMgaW5jb21wYXRpYmxlIHdpdGggYSBtdWx0aXBsYXRmb3JtIGltYWdlLiBTZWUg
Y29tbWl0Cj4+IDg0ZmM4NjM2MDYyMyAoIkFSTTogbWFrZSBBUkNIX01VTFRJUExBVEZPUk0gdXNl
ci12aXNpYmxlIikgZm9yIHNvbWUgbW9yZQo+PiBkZXRhaWxzLgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPj4g
LS0tCj4+IMKgZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnICAgICB8IDIgKy0KPj4gwqBkcml2
ZXJzL2dwdS9pcHUtdjMvS2NvbmZpZyAgICAgIHwgMiArLQo+Cj4gRm9yIGkuTVggLyBJUFV2MywK
Pgo+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+
CgpQdXNoZWQgdG8gZHJtLW1pc2MgKGRybS1taXNjLW5leHQpLiBUaGFua3MhCgotLSAKQmVzdCBy
ZWdhcmRzLAoKSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzCkNvcmUgUGxhdGZvcm1zClJlZCBIYXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
