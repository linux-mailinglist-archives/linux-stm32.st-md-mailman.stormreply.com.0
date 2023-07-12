Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E67505CF
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 13:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56972C6B459;
	Wed, 12 Jul 2023 11:18:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32B0EC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 11:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689160700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqF46ZIeTTxnF0x2v0q2HtXa3ZhclBx145UBtd0H60M=;
 b=AgTcZUhcvNfphObgZtOVRpHm5lp7Kkm8uLOMW68udj7MnBkVAItrcQlzm1yrJ+uE5l/eYF
 nTDTPcPQW4joroP0+vM+uSjctKjdec7PcdZgcWxWOpfc2N9z0mfpry0SSbgTsA/ZRrYewy
 0jw1o3TJ3hznNBWeDYVp+PvJ4s7Y55E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-1GwsPMSCOh--LYAXb3kQ0w-1; Wed, 12 Jul 2023 07:18:17 -0400
X-MC-Unique: 1GwsPMSCOh--LYAXb3kQ0w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso3846158f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 04:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689160696; x=1691752696;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGmoSdcAtbAnvFmDIfmKNE01xrI5yfsr2LA1G6eD+Js=;
 b=Zq+YWbj2q8ESONNQG2vT/0vIi4GcNf19/Dy+kHD+RUJS76lF5UoeeEXnlQAd/TcH7Z
 kNwE0CmyP4E6Xa2btBY3eN1D27mDISRsDT5nPu8VEedh/zp6uA04GEzkUWkRzq8hlZGc
 sfbkJ3iyQ+BKy1NUABTlscZc99uLqDoabVf5ezLRrEFD+cty5lEDiL1hPKCCyC9N8FAP
 RaKD2W+vGaGcLyTAskRKUKytNT8kcR1kNnLldjJwBuc/kIuMiXoq/iujyGKFSxXH+eWO
 9MvHDsKXhYpW5EFfyurXSkoJuzBOiXx1kre4XzFvo9r/7LpkOJGIspawGVabTLnAbNRe
 Y74w==
X-Gm-Message-State: ABy/qLaMFEer7CIF7/Vbe2qDcyTNpg3/5Qa9t55udbjLTPUd5+y15rmy
 5TQHcJdQ7mt99BGguQ7fdC5QhMqIMz/n9z8XHheFIwBaQodx2DrwMxbGEJ5BqI8Cm7l4njAGojb
 TIATub3w44P+qm4LVufhkw4oMAS1Ld9LWs9GNK8oQ
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id
 y4-20020a05600c364400b003fc0627ea31mr12056770wmq.38.1689160695901; 
 Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHe6rz0BytbzD5//h/wnxrk0jp/oOEOt3AbTKSXStRClYkvIUVNGHa0orOjttguAlZUCgSKTg==
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id
 y4-20020a05600c364400b003fc0627ea31mr12056740wmq.38.1689160695625; 
 Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm14151776wmr.46.2023.07.12.04.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <abf26a82-4f17-51f2-5753-785f8516a81a@suse.de>
 <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
Date: Wed, 12 Jul 2023 13:18:14 +0200
Message-ID: <87r0pdgyyx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 John Stultz <jstultz@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, xen-devel@lists.xenproject.org,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, freedreno@lists.freedesktop.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JpdGVz
OgoKW2Ryb3BwaW5nIHNvbWUgcmVjaXBpZW50cyBzaW5jZSBteSBTTVRQIHNlcnZlciB3YXMgY29t
cGxhaW5pbmcgYWJvdXQgdGhlIHNpemVdCgo+IEhlbGxvIFRob21hcywKPgo+IE9uIFdlZCwgSnVs
IDEyLCAyMDIzIGF0IDEyOjE5OjM3UE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+
PiBBbSAxMi4wNy4yMyB1bSAxMTo0NiBzY2hyaWViIFV3ZSBLbGVpbmUtS8O2bmlnOgo+PiA+IEhl
bGxvLAo+PiA+IAo+PiA+IHdoaWxlIEkgZGVidWdnZWQgYW4gaXNzdWUgaW4gdGhlIGlteC1sY2Rj
IGRyaXZlciBJIHdhcyBjb25zdGFudGx5Cj4+ID4gaXJyaXRhdGVkIGFib3V0IHN0cnVjdCBkcm1f
ZGV2aWNlIHBvaW50ZXIgdmFyaWFibGVzIGJlaW5nIG5hbWVkICJkZXYiCj4+ID4gYmVjYXVzZSB3
aXRoIHRoYXQgbmFtZSBJIHVzdWFsbHkgZXhwZWN0IGEgc3RydWN0IGRldmljZSBwb2ludGVyLgo+
PiA+IAo+PiA+IEkgdGhpbmsgdGhlcmUgaXMgYSBiaWcgYmVuZWZpdCB3aGVuIHRoZXNlIGFyZSBh
bGwgcmVuYW1lZCB0byAiZHJtX2RldiIuCj4+IAo+PiBJZiB5b3UgcmVuYW1lIGRybV9jcnRjLmRl
diwgeW91IHNob3VsZCBhbHNvIGFkZHJlc3MgKmFsbCogb3RoZXIgZGF0YQo+PiBzdHJ1Y3R1cmVz
Lgo+Cj4gWWVzLiBDaGFuZ2luZyBkcm1fY3J0Yzo6ZGV2IHdhcyBzb21lIGVmZm9ydCwgc28gSSB0
aG91Z2h0IHRvIHNlbmQgdGhhdAo+IG9uZSBvdXQgYmVmb3JlIGRvaW5nIHRoZSBzYW1lIHRvCj4K
PiAJZHJtX2RwX21zdF90b3BvbG9neV9tZ3IKPiAJZHJtX2F0b21pY19zdGF0ZQo+IAlkcm1fbWFz
dGVyCj4gCWRybV9icmlkZ2UKPiAJZHJtX2NsaWVudF9kZXYKPiAJZHJtX2Nvbm5lY3Rvcgo+IAlk
cm1fZGVidWdmc19lbnRyeQo+IAlkcm1fZW5jb2Rlcgo+IAlkcm1fZmJfaGVscGVyCj4gCWRybV9t
aW5vcgo+IAlkcm1fZnJhbWVidWZmZXIKPiAJZHJtX2dlbV9vYmplY3QKPiAJZHJtX3BsYW5lCj4g
CWRybV9wcm9wZXJ0eQo+IAlkcm1fcHJvcGVydHlfYmxvYgo+IAlkcm1fdmJsYW5rX2NydGMKPgo+
IHdoZW4gaW4gdGhlIGVuZCB0aGUgaW50ZW50aW9uIGlzbid0IHdlbGNvbWUuCj4KPj4gPiBJIGhh
dmUgbm8gc3Ryb25nIHByZWZlcmVuY2UgaGVyZSB0aG91Z2gsIHNvICJkcm1kZXYiIG9yICJkcm0i
IGFyZSBmaW5lCj4+ID4gZm9yIG1lLCB0b28uIExldCB0aGUgYmlrZXNoZWRpbmcgYmVnaW4hCj4+
IAo+PiBXZSd2ZSBkaXNjdXNzZWQgdGhpcyB0byBkZWF0aC4gSUlSQyAnZHJtJyB3b3VsZCBiZSB0
aGUgcHJlZmVyZWQgY2hvaWNlLgo+Cj4gImRybSIgYXQgbGVhc3QgaGFzIHRoZSBhZHZhbnRhZ2Ug
dG8gYmUgdGhlIDJuZCBtb3N0IGNvbW1vbiBuYW1lLiBXaXRoCj4gUGF1bCBLb2NpYWxrb3dza2kg
cHJlZmVyaW5nICJkcm1fZGV2IiB0aGVyZSBpcyBubyBjbGVhciBmYXZvdXJpdGUgeWV0LgoKSSB0
aGluayB0aGF0IGVpdGhlciAiZHJtIiBvciAiZHJtX2RldiIgd291bGQgYmUgbW9yZSBjbGVhciB0
aGFuICJkZXYiLAp3aGljaCBJIGFsc28gZm91bmQgaXQgY29uZnVzaW5nIGFuZCB0aGlua2luZyBh
Ym91dCBhICJzdHJ1Y3QgZGV2aWNlIi4KClByb2JhYmx5IGxlYW5pbmcgdG8gImRybSIsIHNpbmNl
IGFzIHlvdSBzYWlkIGlzIHRoZSBzZWNvbmQgbW9zdCB1c2VkIG5hbWUKaW4gZHJpdmVycyB0aGF0
IGFzc2lnbiBjcnRjLT5kZXYgdG8gYSBsb2NhbCB2YXJpYWJsZS4KCj4gTWF5YmUgYWxsIHRoZSBv
dGhlciBwZW9wbGUgd2l0aCBzdHJvbmcgb3BpbmlvbnMgYXJlIGRlYWQgaWYgdGhpcyB3YXMKPiAi
ZGlzY3Vzc2VkIHRvIGRlYXRoIiBiZWZvcmU/IDotKQo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCj4K
PiAtLSAKPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2Ug
S2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAg
ICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfAoKLS0gCkJlc3Qg
cmVnYXJkcywKCkphdmllciBNYXJ0aW5leiBDYW5pbGxhcwpDb3JlIFBsYXRmb3JtcwpSZWQgSGF0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
