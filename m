Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA7AA07B7
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 11:49:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF82C78024;
	Tue, 29 Apr 2025 09:49:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E948C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 09:49:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 656F74328B;
 Tue, 29 Apr 2025 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745920150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqZ0WDpd3UCnsiyB13GsKoIcLdHmxLRzaHRSKG1EEsE=;
 b=BaZ8t7kO9QR35XhfDlLfJAdORCV3aUUi29DxhEffSeC4/qO92hJbYxjDTNjWePj37YQqqF
 qGV6UZvx7sYqEEapQ2sJNm8niEkNvhO1YEYSUYaDBCnaRPwA/+XiuSdXFeCM0VFFeU/bQY
 63jcFp8qOHYMrHQAugG28HWTCZ2mKc9+ShVrmzLnKjnShPn3uM5fl9OcmuIovrkmIk9dnB
 +mgoGULFSg3PqOsylSrO84e2Aq1HJ8dM5/81jemh5xyMQ8O6QnGTO/ieBXvFUb2f2tyJxA
 AscSm/s01ycVbb1sJuvhgTwL7GxTNG7mEqCS/+UO/dOKPnWJJyxUsEMvUKnq3Q==
Mime-Version: 1.0
Date: Tue, 29 Apr 2025 11:49:08 +0200
Message-Id: <D9J11FERN5K4.1OUFGN6L9LM9E@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Eduard
 Zingerman" <eddyz87@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
 <3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
 <D9I6TQN2I6B1.QC4FFHEWAURZ@bootlin.com> <m21ptcmdnw.fsf@gmail.com>
 <D9IKA5K8PFAO.21V0PXVU6VPF1@bootlin.com>
In-Reply-To: <D9IKA5K8PFAO.21V0PXVU6VPF1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfevofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetudfgvefhveeugeegudethffgvefhleetgfeijeejieejjeevgedtheegfeekhfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtr
 ggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah
 Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Mykola Lysenko <mykolal@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Will Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Hao Luo <haoluo@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 3/4] bpf/selftests: add tests
 to validate proper arguments alignment on ARM64
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

T24gTW9uIEFwciAyOCwgMjAyNSBhdCAxMDo0MSBQTSBDRVNULCBBbGV4aXMgTG90aG9yw6kgd3Jv
dGU6Cj4gT24gTW9uIEFwciAyOCwgMjAyNSBhdCA2OjUyIFBNIENFU1QsIEVkdWFyZCBaaW5nZXJt
YW4gd3JvdGU6Cj4+IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
IHdyaXRlczoKCj4gSWYgdGhpbmdzIHJlYWxseSBiZWhhdmVkIGNvcnJlY3RseSwgZiB3b3VsZCBu
b3QgaGF2ZSB0aGUgY29ycmVjdCB2YWx1ZSBidXQKPiB3b3VsZCBzdGlsbCBiZSBoYW5kbGVkIGFz
IGEgMTYgYnl0ZXMgdmFsdWUsIHNvIHRoZSB0ZXN0IHdvdWxkIG5vdCBmYWlsIHdpdGgKPiAiYWN0
dWFsIDM1ICE9IDQzIiwgYnV0IHNvbWV0aGluZyBsaWtlICJhY3R1YWwKPiAyNzI1NDQ4NzkwNDkw
NjkzMjEzMjE3OTExODkxNTU4NCAhPSA0MyIgKDQzIDw8IDY0IHwgMzUpIEkgZ3Vlc3MuIEkgc3Rp
bGwKPiBuZWVkIHRvIHNvcnQgdGhpcyBvdXQuCgpBbmQgc28gaW5kZWVkLCB0aGUgYnJva2VuIHZh
bHVlIGlzIGEgYmlnIG9uZToKCihnZGIpIHAgc2tlbC0+YnNzLT50MTFfZgokNCA9IDc5MzIwOTk5
NTE2OTUxMDcxOTUyMwooZ2RiKSBwL3ggc2tlbC0+YnNzLT50MTFfZgokNSA9IDB4MmIwMDAwMDAw
MDAwMDAwMDIzCihnZGIpCgpCdXQgd2Ugc2VlIHRoZSAzNSAoMHgyMykgdmFsdWUgaW4gdGhlIGVy
cm9yIGxvZyBiZWNhdXNlIHRoZSBmb3JtYXR0ZXJzIHVzZWQgaW4KQVNTRVJUX0VRIHRydW5jYXRl
IHRoZSBhY3R1YWwgdmFsdWUuCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
