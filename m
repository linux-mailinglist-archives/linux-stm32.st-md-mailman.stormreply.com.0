Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E028AD0689
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jun 2025 18:22:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17EC6C3F930;
	Fri,  6 Jun 2025 16:22:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B1C0C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jun 2025 16:22:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so1823810f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jun 2025 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749226956; x=1749831756;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KP+8ZJbQ3Iy35rM91JKh8W2oEf1yzBugHuEwD4w/SXs=;
 b=lmfPVpuHB2sV/uj94SPJ28xHohVKJFM1nJdVPiL+7Amd5rY1bLrT/s6WWkUWrddzI+
 WdrK4XsQ2opOrk61vNvi86oNW+Kq9rCGVt4eI9gbjdA6L2w4h7eGq36QwoqMEKg2/6/B
 Y/d4qMqfKWP1u/8NcTRNlzAjlEbU6jPDheojUfL0gnxkrUj+9LUCtKUaAoAsLrEkRFlW
 YLgz4vPC1pUVU1SUtKxas7k4m8u+zRgVzLzphk9FGQwOPcf7x0EK3P0U5pLk9CzxRGoS
 MGKf4E5C4VSMB2t3XrbJw727hWmhC+inugWOLSpIYD4qQz486ssthTvaxPRWc7UUTw0W
 Gkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749226956; x=1749831756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KP+8ZJbQ3Iy35rM91JKh8W2oEf1yzBugHuEwD4w/SXs=;
 b=Ihxgn6Y94ac8pREUy1D6CzEnJLKlTruEV2cNrAP2M0KSeOHFbXrBCXqLIofgAtguih
 Ae2sEsPX6QjofMV7nc6gXxPOCXmSOk27mwdst2bZLQYSRMBTKBSJT0+0/UN/V3wlVjXK
 XYO7VX0K3Ca3wi1vinhba9RYtn1pbmqBnF0u7TP1OhNXTNmXqGTKI6EQdZv/NFTf9M9C
 bLqsoAvLAVfX1QWK3hB2fyN1crshDVnODG2HSh5wDDuBpmf4OjMYnVsp1foWuI/i6Bks
 N1cmXiLlnNgPA0QhHlXDd0XZaZfUpUQMv5FQXGJ4fW65dA4c2CAtjwashisQx1pf6xWy
 vxwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIF0WsCUnz6mWxzIVXsjHURPZEqRnEy9OhDg+9Xd3GVtpm3kgfLYdwYasHSOlAZ/aJhNyZ7R1QHZRf4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDFnNXKfjO3q8b92Khfy97PUQB8U++JFNf1CYftQwbGJkvoaIw
 6LT6P4dPXlJmBKg6P4abMNDQS+9cT2U5dnrNAmNVxCfskoAGBdeHkXka3y676HJk5wMMuIdt8rg
 CWtHpcTePS6wT6dsqSjMwcX/IznYgsic=
X-Gm-Gg: ASbGnctvCrRT43f/09/7rO7Wu/dK0KRFfc/N9We6AmI7m6dYVrcycz/LLZiq5Dp1F58
 RhK5iCLTfgjGX9dpxV54/0VMPV7+LCeeh/bdQUiV1PdBjcLtMFPAz9YPp9lDVxOmHdqKq2S4OeM
 I6TwdsHMo7DjHXC08+yhfhcEI9afEXMgwk3IvmxVBRbrKuCy2jYsuWUu78W8bYcw==
X-Google-Smtp-Source: AGHT+IGVEAky3KX3oy4NEAVyuC3jToJkW1CmYjw5OMscoOz7z7KXYJisj9AihaxTJFjuwXjoE5ERBeNQiq7yk/6UiSY=
X-Received: by 2002:a05:6000:288c:b0:3a4:db49:94aa with SMTP id
 ffacd0b85a97d-3a531ab5272mr3524523f8f.21.1749226955387; Fri, 06 Jun 2025
 09:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
 <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
 <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
 <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
In-Reply-To: <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Jun 2025 09:22:24 -0700
X-Gm-Features: AX0GCFtcDPhEpzZqMjlQoxov485AHY3mrKKmWdCvVJeIQl1NL0jKc2KqPI-LVsc
Message-ID: <CAADnVQKr3ftNt1uQVrXBE0a2o37ZYRo2PHqCoHUnw6PE5T2LoA@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 dwarves@vger.kernel.org, Ihor Solodrai <ihor.solodrai@linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [Question] attributes encoding in BTF
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCAxMjo0NeKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleGVpLAo+Cj4gT24gVGh1IEp1
biA1LCAyMDI1IGF0IDY6MDkgUE0gQ0VTVCwgQWxleGVpIFN0YXJvdm9pdG92IHdyb3RlOgo+ID4g
T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMjozNeKAr0FNIEFsZXhpcyBMb3Rob3LDqQo+ID4gPGFs
ZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpIElob3IsCj4gPj4K
PiA+PiBPbiBXZWQgSnVuIDQsIDIwMjUgYXQgNzozMSBQTSBDRVNULCBJaG9yIFNvbG9kcmFpIHdy
b3RlOgo+ID4+ID4gT24gNi80LzI1IDI6MDIgQU0sIEFsZXhpcyBMb3Rob3LDg8KpIHdyb3RlOgo+
Cj4gWy4uLl0KPgo+ID4+IFRoYW5rcyBmb3IgdGhlIGRldGFpbHMgISBJIGhhdmUgbWlzc2VkIHRo
aXMgcG9zc2liaWxpdHksIGFzIEkgaGF2ZSBiZWVuCj4gPj4gYXNzdW1pbmcgdGhhdCBEV0FSRiBp
bmZvIHdhcyBleHBvc2luZyB0aGUgbmVlZGVkIGluZm8uIEknbGwgdGFrZSBhIGxvb2sgYXQKPiA+
PiBpdCwgYnV0IGlmIHRob3NlIGF0dHJpYnV0ZXMgY2FuIG5vdCBiZSByZXByZXNlbnRlZCBieSBE
V0FSRiwgSSdsbCBoYXZlIHRvCj4gPj4gZmluZCBhbm90aGVyIHdheSBvZiBnZXR0aW5nIHRob3Nl
IHBhY2tpbmcvYWxpZ25tZW50IG1vZGlmaWNhdGlvbnMgb24gZGF0YQo+ID4+IHR5cGUgKGVnOiBy
ZS11c2Uvc2hhcmUgYnRmX19hbGlnbl9vZiBmcm9tIGxpYmJwZiwgYXMgc3VnZ2VzdGVkIGJ5IEFu
ZHJpaSwKPiA+PiBidXQgaXQgbWF5IG5vdCBhYmxlIHRvIGNvdmVyIGFsbCBjYXNlcykuCj4gPgo+
ID4gTm90IHN1cmUgYWxsIHRoZSB0cm91YmxlIGlzIHdvcnRoIGl0Lgo+ID4gSSBmZWVsIGl0J3Mg
YSBjb3JuZXIgY2FzZS4gU29tZXRoaW5nIHdlIGRvbid0IG5lZWQgdG8gZml4Lgo+Cj4gVEJIIEkg
ZG9uJ3Qgb3duIGFueSBzcGVjaWZpYyB1c2UgY2FzZSByZWFsbHkgbmVlZGluZyB0aGlzIGhhbmRs
aW5nLCBzbyBpZgo+IGl0IGRvZXMgbm90IGZlZWwgd29ydGggdGhlIHRyb3VibGUsIEknbSBmaW5l
IHdpdGggbm90IHRyeWluZyB0byBzdXBwb3J0Cj4gdGhpcy4gTXkgZWZmb3J0IGlzIHJhdGhlciBt
b3RpdmF0ZWQgYnkgdGhlIGdvYWwgb2YgYWxpZ25pbmcgdGhlIEFSTTY0Cj4gZmVhdHVyZXMgd2l0
aCBvdGhlciBwbGF0Zm9ybSwgYW5kIHNvIG9mIGdldHRpbmcgcmlkIG9mCj4gdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQuCj4KPiBGb3IgdGhlIHJlY29yZCwgdGhp
cyBlZmZvcnQgYWxzbyBzaG93ZWQgdGhhdCB0aGUgc2FtZSBraW5kIG9mIGlzc3VlIGFmZmVjdHMK
PiBvdGhlciBwbGF0Zm9ybXMgYWxyZWFkeSBzdXBwb3J0aW5nIG1hbnkgYXJncyArIHN0cnVjdHMg
cGFzc2VkIGJ5IHZhbHVlIChbMV0pCj4gLSBzdHJ1Y3RzIGFsaWdubWVudCB3aXRoIHNwZWNpZmlj
IGFsaWdubWVudCBjb25zdHJhaW50cyBhcmUgbm90Cj4gICBzcGVjaWZpY2FsbHkgaGFuZGxlZCAo
ZWc6IGEgc3RydWN0IHdpdGggYW4gX19pbnQxMjggYXMgYSB0b3AtbGV2ZWwKPiAgIG1lbWJlciwg
bGVhZGluZyB0byBhIDE2IGJ5dGUgYWxpZ25tZW50IHJlcXVpcmVtZW50KQo+IC0gcGFja2luZyBh
bmQgY3VzdG9tIGFsaWdubWVudCBpcyBub3QgaGFuZGxlZAo+Cj4gRnJvbSB0aGVyZSwgSSBjb3Vs
ZCBkbyB0d28gZGlmZmVyZW50IHRoaW5nczoKPiAxLiBkbyBub3RoaW5nLCBrZWVwIEFSTTY0IGFz
LWlzIHdpdGggdGhlIGN1cnJlbnQgdmVyc2lvbiB3aGljaCBoYXMgYmVlbgo+ICAgcmVjZW50bHkg
bWVyZ2VkOiBBUk02NCB0aGVuIGRlbmllcyBhdHRhY2htZW50IHRvIGFueSBmdW5jdGlvbiB0cnlp
bmcgdG8KPiAgIHBhc3MgYSBzdHJ1Y3QgYnkgdmFsdWUgb24gc3RhY2suIFdlIGtlZXAgdGhlIHRy
YWNpbmdfc3RydWN0IHRlc3RzIGRlbmllZAo+ICAgZm9yIEFSTTY0LiBPdGhlciBwbGF0Zm9ybXMg
c3RpbGwgYWxsb3cgdG8gYXR0YWNoIHN1Y2ggZnVuY3Rpb25zLCBidXQgbWF5Cj4gICBiZSBwYXJz
aW5nIHdyb25nbHkgYXJndW1lbnRzIGluIHRob3NlIHNwZWNpZmljIGNhc2VzLgo+IDIuIGFkZCB0
aGUgY29uc3RyYWludCBhcHBsaWVkIG9uIEFSTTY0IChyZWZ1c2luZyBhdHRhY2htZW50IHdoZW4g
c3RydWN0cyBhcmUKPiAgIHBhc3NlZCB0aHJvdWdoIHN0YWNrKSB0byBvdGhlciBKSVQgY29tcGls
ZXJzLiBUaGVuIHVwZGF0ZSB0aGUKPiAgIHRyYWNpbmdfc3RydWN0IHRlc3QgdG8gZW5zdXJlIHRo
aXMgc3BlY2lmaWMgY2FzZSBpcyBwcm9wZXJseSBkZW5pZWQgb24KPiAgIGFsbCBwbGF0Zm9ybXMg
dG8gYXZvaWQgcmlza2luZyByZWFkaW5nIHdyb25nbHkgYXJndW1lbnRzIHBhc3NlZCB0aHJvdWdo
Cj4gICBzdGFjayB3aGVuIHN0cnVjdHMgb3IgbGFyZ2UgdHlwZXMgYXJlIGludm9sdmVkLgo+Cj4g
SSB0ZW5kIHRvIHRoaW5rIDIuIGlzIGJldHRlciwgYnV0IGxldCBtZSBrbm93IGlmIHlvdSBoYXZl
IGEgZGlmZmVyZW50Cj4gb3BpbmlvbiBoZXJlLgoKQWdyZWUuIHRyYWNpbmdfc3RydWN0X21hbnlf
YXJncyBpcyB3b3JraW5nIG9uIHg4NiwgYnV0IGFzc3VtcHRpb25zCmFib3V0IEJURiBiZWluZyBh
YmxlIHRvIGV4cHJlc3MgZXZlcnl0aGluZyBhYm91dCBjYWxsaW5nIGNvbnZlbnRpb24Kd2VyZSBu
b3QgY29ycmVjdCwgc28gbGV0J3Mgcm9sbCBiYWNrLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
