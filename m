Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF51AC4A7D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 10:45:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7815DC36B16;
	Tue, 27 May 2025 08:45:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5C43C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 08:45:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 701CF43137;
 Tue, 27 May 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748335510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzPRMr1l+fHaNToRkbY1GkYZ/zbxBgq6V8xrU1tHPf8=;
 b=WsHtfjyboYTn/inoED+hlu32+QYRGzVRTfeTxdp4gHe0upe98p4LMB8qXn4HvSNRYlUo0P
 7X5QOwXR+mVsIlNhhLnSgqo56DgD0KhdaRFeMMV+rIhpTm4V5EDCbnOqYO448ucWaJ8lih
 yTsdqmHp3lKzba+38ROjgdOTObnT5A1u3HMSCn4xndSuwcNscAQekWO5izBz6Yfp4RiqlO
 snkxmUjnPsQZEuO2D48+cvX0sqhldyw6b4Ml/ZwU9FsLdaS2PW8qUagGqfstCDPPoFg/Lw
 4eE0U/M9lzRCgpLz1w8SjY1h3XgCpUfQxbTC+klPVsmED9PpYGvnksdxgwljsg==
Date: Tue, 27 May 2025 10:45:07 +0200
Message-Id: <DA6T7OEF94IG.2BH2PWTCVEOTA@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
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
Mime-Version: 1.0
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
 <20250522-many_args_arm64-v2-1-d6afdb9cf819@bootlin.com>
 <8d184497-fecf-497f-8b4c-bcd4b0a697ce@huaweicloud.com>
In-Reply-To: <8d184497-fecf-497f-8b4c-bcd4b0a697ce@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurheptgffkffhvfevufgggffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefiedtuedvgfekkeefteelkedvheehvdetuedtgfekueeuheelhfdvgfdtvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeihedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrf
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

SGkgWHUsIHRoYW5rcyBmb3IgdGhlIHJldmlldwoKT24gVHVlIE1heSAyNywgMjAyNSBhdCAxMDox
MSBBTSBDRVNULCBYdSBLdW9oYWkgd3JvdGU6Cj4gT24gNS8yMi8yMDI1IDY6MTQgUE0sIEFsZXhp
cyBMb3Rob3LDqSB3cm90ZToKPgo+IFsuLi5dCj4KPj4gLXN0YXRpYyB2b2lkIHNhdmVfYXJncyhz
dHJ1Y3Qgaml0X2N0eCAqY3R4LCBpbnQgYXJnc19vZmYsIGludCBucmVncykKPj4gK3N0cnVjdCBh
cmdfYXV4IHsKPj4gKwkvKiBob3cgbWFueSBhcmdzIGFyZSBwYXNzZWQgdGhyb3VnaCByZWdpc3Rl
cnMsIHRoZSByZXN0IG9mIHRoZSBhcmdzIGFyZQo+PiArCSAqIHBhc3NlZCB0aHJvdWdoIHN0YWNr
Cj4+ICsJICovCj4+ICsJaW50IGFyZ3NfaW5fcmVnczsKPj4gKwkvKiBob3cgbWFueSByZWdpc3Rl
cnMgYXJlIHVzZWQgdG8gcGFzcyBhcmd1bWVudHMgKi8KPj4gKwlpbnQgcmVnc19mb3JfYXJnczsK
Pj4gKwkvKiBob3cgbXVjaCBzdGFjayBpcyB1c2VkIGZvciBhZGRpdGlvbmFsIGFyZ3MgcGFzc2Vk
IHRvIGJwZiBwcm9ncmFtCj4+ICsJICogdGhhdCBkaWQgbm90IGZpdCBpbiBvcmlnaW5hbCBmdW5j
dGlvbiByZWdpc3RlcnMKPj4gKwkgKiovCj4KPiBuaXQ6ICIqKi8iIHNob3VsZCBiZSAiKi8iCgpB
Q0sKClsuLi5dCgo+PiArCWEtPm9zdGFja19mb3JfYXJncyA9IDA7Cj4+ICsKPj4gKwkvKiB0aGUg
cmVzdCBhcmd1bWVudHMgYXJlIHBhc3NlZCB0aHJvdWdoIHN0YWNrICovCj4+ICsJZm9yIChhLT5v
c3RhY2tfZm9yX2FyZ3MgPSAwLCBhLT5ic3RhY2tfZm9yX2FyZ3MgPSAwOwo+PiArCSAgICAgaSA8
IG0tPm5yX2FyZ3M7IGkrKykgewo+Cj4gYS0+b3N0YWNrX2Zvcl9hcmdzIGlzIGluaXRpYWxpemVk
IHR3aWNlLgo+Cj4gbW92ZSBhbGwgaW5pdGlhbGl6YXRpb25zIGJlZm9yZSB0aGUgbG9vcD8KCkFD
SwoKPj4gKwkJLyogV2UgY2FuIG5vdCBrbm93IGZvciBzdXJlIGFib3V0IGV4YWN0IGFsaWdubWVu
dCBuZWVkcyBmb3IKPj4gKwkJICogc3RydWN0IHBhc3NlZCBvbiBzdGFjaywgc28gZGVueSB0aG9z
ZQo+PiArCQkgKi8KPj4gKwkJaWYgKG0tPmFyZ19mbGFnc1tpXSAmIEJURl9GTU9ERUxfU1RSVUNU
X0FSRykKPj4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsKPgo+IGxlYXZlIHRoZSBlcnJvciBjb2Rl
IGFzIGlzLCBuYW1lbHksIHJldHVybiAtRU5PVFNVUFA/CgpBY3R1YWxseSB0aGlzIGNoYW5nZSBm
b2xsb3dzIGEgY29tcGxhaW50IGZyb20gY2hlY2twYXRjaDoKCiJXQVJOSU5HOiBFTk9UU1VQUCBp
cyBub3QgYSBTVVNWNCBlcnJvciBjb2RlLCBwcmVmZXIgRU9QTk9UU1VQUCIKCj4+ICsJCXN0YWNr
X3Nsb3RzID0gKG0tPmFyZ19zaXplW2ldICsgNykgLyA4Owo+PiArCQkvKiBBQVBDUyA2NCBDLjE0
OiBhcmd1bWVudHMgcGFzc2VkIG9uIHN0YWNrIG11c3QgYmUgYWxpZ25lZCB0bwo+PiArCQkgKiBt
YXgoOCwgYXJnX25hdHVyYWxfYWxpZ25tZW50KQo+PiArCQkgKi8KPj4gKwkJYS0+YnN0YWNrX2Zv
cl9hcmdzICs9IHN0YWNrX3Nsb3RzICogODsKPj4gKwkJYS0+b3N0YWNrX2Zvcl9hcmdzID0gcm91
bmRfdXAoYS0+b3N0YWNrX2Zvcl9hcmdzICsgc3RhY2tfc2xvdHMgKiA4LCA4KTsKPgo+IHNpbmNl
IGEtPm9zdGFja19mb3JfYXJncyBzdGFydHMgZnJvbSAwIGFuZCBpcyBhbHdheXMgaW5jcmVtZW50
ZWQKPiBieSBtdWx0aXBsZXMgb2YgOCwgcm91bmRfdXAoKSB0byA4IGlzIG5vdCBuZWVkZWQuCgpU
cnVlLiBUaGlzIGlzIGEgKHBhcnRpYWwpIHJlbW5hbnQgZnJvbSB0aGUgZmlyc3QgYXR0ZW1wdCB0
byBoYW5kbGUgbW9yZQpleG90aWMgYWxpZ25tZW50cyBsaWtlIGxhcmdlIHN0cnVjdHMgb3IgX19p
bnQxMjgsIGJ1dCB0aGF0J3MgaW5kZWVkIG5vdApuZWVkZWQgZm9yIHRoaXMgY3VycmVudCB2ZXJz
aW9uLiBJJ2xsIGNsZWFuIGl0IHVwLgoKWy4uLl0KCj4+ICsJZm9yIChpID0gYS0+YXJnc19pbl9y
ZWdzOyBpIDwgbS0+bnJfYXJnczsgaSsrKSB7Cj4+ICsJCXNsb3RzID0gKG0tPmFyZ19zaXplW2ld
ICsgNykgLyA4Owo+PiArCQkvKiBBQVBDUyBDLjE0OiBhZGRpdGlvbmFsIGFyZ3VtZW50cyBvbiBz
dGFjayBtdXN0IGJlCj4+ICsJCSAqIGFsaWduZWQgb24gbWF4KDgsIGFyZ19uYXR1cmFsX2FsaWdu
bWVudCkKPj4gKwkJICovCj4+ICsJCXNvZmYgPSByb3VuZF91cChzb2ZmLCA4KTsKPj4gKwkJaWYg
KGZvcl9jYWxsX29yaWdpbikKPj4gKwkJCWRvZmYgPSAgcm91bmRfdXAoZG9mZiwgOCk7Cj4KPiBz
aW5jZSBib3RoIHNvZmYgYW5kIGRvZmYgc3RhcnQgZnJvbSBtdWx0aXBsZXMgb2YgOCBhbmQgYXJl
Cj4gaW5jcmVtZW50ZWQgYnkgOCBlYWNoIHRpbWUsIHRoZSB0d28gcm91bmRfdXAoKXMgYXJlIGFs
c28KPiBub3QgbmVlZGVkLgoKQUNLLiBJIGd1ZXNzIHRoZSBzbWFsbCBBQVBDUyBtZW50aW9uIGNh
biBnbyB0b28gdGhlbi4KCj4KPj4gKwkJLyogdmVyaWZpZXIgZW5zdXJlcyBhcmdfc2l6ZSA8PSAx
Niwgc28gc2xvdHMgZXF1YWxzIDEgb3IgMiAqLwo+PiArCQl3aGlsZSAoc2xvdHMtLSA+IDApIHsK
Pj4gKwkJCWVtaXQoQTY0X0xEUjY0SSh0bXAsIEE2NF9GUCwgc29mZiksIGN0eCk7Cj4+ICsJCQkv
KiBpZiB0aGVyZSBpcyB1bnVzZWQgc3BhY2UgaW4gdGhlIGxhc3Qgc2xvdCwgY2xlYXIKPj4gKwkJ
CSAqIHRoZSBnYXJiYWdlIGNvbnRhaW5lZCBpbiB0aGUgc3BhY2UuCj4+ICsJCQkgKi8KPj4gKwkJ
CWlmIChzbG90cyA9PSAwICYmICFmb3JfY2FsbF9vcmlnaW4pCj4+ICsJCQkJY2xlYXJfZ2FyYmFn
ZShjdHgsIHRtcCwgbS0+YXJnX3NpemVbaV0gJSA4KTsKPj4gKwkJCWVtaXQoQTY0X1NUUjY0SSh0
bXAsIEE2NF9TUCwgZG9mZiksIGN0eCk7Cj4+ICsJCQlzb2ZmICs9IDg7Cj4+ICsJCQlkb2ZmICs9
IDg7Cj4+ICsJCX0KPj4gKwl9Cj4+ICt9Cj4KPiBbLi4uXQoKCgoKLS0gCkFsZXhpcyBMb3Rob3LD
qSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
