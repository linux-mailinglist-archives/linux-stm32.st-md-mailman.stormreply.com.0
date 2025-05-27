Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED2AC4B48
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 11:13:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C5AC36B18;
	Tue, 27 May 2025 09:13:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09F35C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 09:13:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72BCA43289;
 Tue, 27 May 2025 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748337203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pg9vGp1YHkXIBdUOEtw6pvaguTK4l9KgzQWa/jWZ448=;
 b=Xb2vwIHVkxdOdtkzTqahMB8Ob0dPQkUA3ReoZGJM1L+qUX1Vj82fd4mZq3PzhNP32O1Jkx
 rxSGUArUiUNECAYK3qxLtiRJm5PaVkldh1ripu3EGGANBnyTGQYq5Z+wUniIQZpG3OSQyk
 fxy6iFkZ1zsno/GpVwOBAXOScSRK5Mgsp+pYsnop4MUJoH89/jvP3BX3j5OL2l62j7QPHZ
 TRfxyJo+oz1CBl0pusuylCCBt1fFB0hODm+XfsGwexCOGnNlrkkNuQndIhVhgWYEdQAkkB
 hu1CaDW+KPMGWdK7cB6wT/wJ4KKgUCIsA72wVLDaMj7d8mqzcV15qqamYMzVfw==
Mime-Version: 1.0
Date: Tue, 27 May 2025 11:13:21 +0200
Message-Id: <DA6TTA76AU5Z.32W0O8EORBCQC@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "KP Singh" <kpsingh@kernel.org>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
 <20250522-many_args_arm64-v2-1-d6afdb9cf819@bootlin.com>
 <8d184497-fecf-497f-8b4c-bcd4b0a697ce@huaweicloud.com>
 <DA6T7OEF94IG.2BH2PWTCVEOTA@bootlin.com>
 <5535f49f-8903-4055-b99a-cf8b2d4666e1@huaweicloud.com>
In-Reply-To: <5535f49f-8903-4055-b99a-cf8b2d4666e1@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleelleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvvefuhffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefgfffhhefhfeegkefhffduhfehkeevffeluefhlefgfeeuveehvdekudfhheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeihedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrf
 hgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 1/2] bpf,
 arm64: Support up to 12 function arguments
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

T24gVHVlIE1heSAyNywgMjAyNSBhdCAxMTowOSBBTSBDRVNULCBYdSBLdW9oYWkgd3JvdGU6Cj4g
T24gNS8yNy8yMDI1IDQ6NDUgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPgo+IFsuLi5dCj4K
Pj4+PiArCQkvKiBXZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgYWJvdXQgZXhhY3QgYWxpZ25tZW50
IG5lZWRzIGZvcgo+Pj4+ICsJCSAqIHN0cnVjdCBwYXNzZWQgb24gc3RhY2ssIHNvIGRlbnkgdGhv
c2UKPj4+PiArCQkgKi8KPj4+PiArCQlpZiAobS0+YXJnX2ZsYWdzW2ldICYgQlRGX0ZNT0RFTF9T
VFJVQ1RfQVJHKQo+Pj4+ICsJCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+PiBsZWF2ZSB0aGUgZXJy
b3IgY29kZSBhcyBpcywgbmFtZWx5LCByZXR1cm4gLUVOT1RTVVBQPwo+PiBBY3R1YWxseSB0aGlz
IGNoYW5nZSBmb2xsb3dzIGEgY29tcGxhaW50IGZyb20gY2hlY2twYXRjaDoKPj4gCj4+ICJXQVJO
SU5HOiBFTk9UU1VQUCBpcyBub3QgYSBTVVNWNCBlcnJvciBjb2RlLCBwcmVmZXIgRU9QTk9UU1VQ
UCIKPgo+IFNlZW1zIHdlIGNhbiBqdXN0IGlnbm9yZSB0aGlzIHdhcm5pbmcsIGFzIEVOT1RTVVBQ
IGlzIGFscmVhZHkgdXNlZAo+IHRocm91Z2hvdXQgYnBmLCBhbmQgdGhlIGFjdHVhbCB2YWx1ZSAt
NTI0IGlzIHdlbGwgcmVjb2duaXplZC4KCk9rLCB0aGVuIEknbGwgc3dpdGNoIGl0IGJhY2sgdG8g
RU5PVFNVUFAKCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
