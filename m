Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0A30001D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 11:24:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B192C3FADC;
	Fri, 22 Jan 2021 10:24:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD383C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 10:24:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MAGnhf017656; Fri, 22 Jan 2021 11:23:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F3UYlhBVC/4pASDg25u1A1PdjtKhaE7ztzNCp+C1SLo=;
 b=8KCo4S4sWNkUsEBwP+3U7lcU73U/aDulJM7dKmb/CL+XRj7yASBkLG85vB5zww3eOIUm
 b2tYlQIiAbAvYrTtwBzw92V0Gz6qXLIiaM90jEx+mIL6Y4BAmnklU6TfbAFOakx60S30
 wqIP4TiRkz08UuAEQH5cpnxCV40UH3u37Nk6BJ4YY+0ty/tEoHKPk8gBQVF9fSNwtcOt
 yddy+eY9qWY1YSNtH7eX4VeNgRQFi6I8nS6KTWLFv7wT76f9YFwk2oUMBMdkbkxuK+lA
 Iva+m7oFmwGl0VBMThw8Vln95vBfWuOr9blFY5FAqPzSKi9xAtaVsC+GT6BWkHAKEFfL Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668q08u2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 11:23:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51BC110002A;
 Fri, 22 Jan 2021 11:23:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34C9D20D085;
 Fri, 22 Jan 2021 11:23:45 +0100 (CET)
Received: from [10.211.13.44] (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan
 2021 11:23:43 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
References: <20210121180228.30621-1-a.fatoum@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <52a8a7db-72ee-a00f-7ef5-ada85cfe4774@foss.st.com>
Date: Fri, 22 Jan 2021 11:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121180228.30621-1-a.fatoum@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_06:2021-01-21,
 2021-01-22 signatures=0
Cc: Holger Assmann <has@pengutronix.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: enable timestamping
 for non-DMA usage
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

T24gMS8yMS8yMSA3OjAyIFBNLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4gRm9yIG5vbi1ETUEgdXNh
Z2UsIHdlIGhhdmUgYW4gZWFzeSB3YXkgdG8gYXNzb2NpYXRlIGEgdGltZXN0YW1wIHdpdGggYQo+
IHNhbXBsZTogaWlvX3BvbGxmdW5jX3N0b3JlX3RpbWUgc3RvcmVzIGEgdGltZXN0YW1wIGluIHRo
ZSBwcmltYXJ5Cj4gdHJpZ2dlciBJUlEgaGFuZGxlciBhbmQgc3RtMzJfYWRjX3RyaWdnZXJfaGFu
ZGxlciBydW5zIGluIHRoZSBJUlEgdGhyZWFkCj4gdG8gcHVzaCBvdXQgdGhlIGJ1ZmZlciBhbG9u
ZyB3aXRoIHRoZSB0aW1lc3RhbXAuCj4KPiBGb3IgdGhpcyB0byB3b3JrLCB0aGUgZHJpdmVyIG5l
ZWRzIHRvIHJlZ2lzdGVyIGFuIElJT19USU1FU1RBTVAgY2hhbm5lbC4KPiBEbyB0aGlzLgo+Cj4g
Rm9yIERNQSwgaXQncyBub3QgYXMgZWFzeSwgYmVjYXVzZSB3ZSBkb24ndCBwdXNoIHRoZSBidWZm
ZXJzIG91dCBvZgo+IHN0bTMyX2FkY190cmlnZ2VyLCBidXQgb3V0IG9mIHN0bTMyX2FkY19kbWFf
YnVmZmVyX2RvbmUsIHdoaWNoIHJ1bnMgaW4KPiBhIHRhc2tsZXQgc2NoZWR1bGVkIGFmdGVyIGEg
RE1BIGNvbXBsZXRpb24uCj4KPiBQcmVmZXJhYmx5LCB0aGUgRE1BIGNvbnRyb2xsZXIgd291bGQg
Y29weSB1cyB0aGUgdGltZXN0YW1wIGludG8gdGhhdCBidWZmZXIKPiBhcyB3ZWxsLiBVbnRpbCB0
aGlzIGlzIGltcGxlbWVudGVkLCByZXN0cmljdCB0aW1lc3RhbXBpbmcgc3VwcG9ydCB0bwo+IG9u
bHkgUElPLiBGb3IgbG93LWZyZXF1ZW5jeSBzYW1wbGluZywgUElPIGlzIHByb2JhYmx5IGdvb2Qg
ZW5vdWdoLgo+Cj4gQ2M6IEhvbGdlciBBc3NtYW5uIDxoYXNAcGVuZ3V0cm9uaXguZGU+Cj4gU2ln
bmVkLW9mZi1ieTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KPiAtLS0K
PiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMgYi9kcml2
ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMKPiBpbmRleCBjMDY3Yzk5NGRhZTIuLjkxZDk0ODNlMWY1
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMKPiArKysgYi9kcml2
ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMKPiBAQCAtMTcxOCw3ICsxNzE4LDcgQEAgc3RhdGljIHZv
aWQgc3RtMzJfYWRjX2NoYW5faW5pdF9vbmUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiAg
CX0KPiAgfQo+ICAKPiAtc3RhdGljIGludCBzdG0zMl9hZGNfY2hhbl9vZl9pbml0KHN0cnVjdCBp
aW9fZGV2ICppbmRpb19kZXYpCj4gK3N0YXRpYyBpbnQgc3RtMzJfYWRjX2NoYW5fb2ZfaW5pdChz
dHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBib29sIHRpbWVzdGFtcGluZykKPiAgewo+ICAJc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlID0gaW5kaW9fZGV2LT5kZXYub2Zfbm9kZTsKPiAgCXN0cnVj
dCBzdG0zMl9hZGMgKmFkYyA9IGlpb19wcml2KGluZGlvX2Rldik7Cj4gQEAgLTE3NjYsNiArMTc2
Niw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX2NoYW5fb2ZfaW5pdChzdHJ1Y3QgaWlvX2RldiAq
aW5kaW9fZGV2KQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiArCWlmICh0aW1lc3Rh
bXBpbmcpCj4gKwkJbnVtX2NoYW5uZWxzKys7Cj4gKwo+ICAJY2hhbm5lbHMgPSBkZXZtX2tjYWxs
b2MoJmluZGlvX2Rldi0+ZGV2LCBudW1fY2hhbm5lbHMsCj4gIAkJCQlzaXplb2Yoc3RydWN0IGlp
b19jaGFuX3NwZWMpLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghY2hhbm5lbHMpCj4gQEAgLTE4MTYs
NiArMTgxOSwxOSBAQCBzdGF0aWMgaW50IHN0bTMyX2FkY19jaGFuX29mX2luaXQoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldikKPiAgCQlzdG0zMl9hZGNfc21wcl9pbml0KGFkYywgY2hhbm5lbHNb
aV0uY2hhbm5lbCwgc21wKTsKPiAgCX0KPiAgCj4gKwlpZiAodGltZXN0YW1waW5nKSB7Cj4gKwkJ
c3RydWN0IGlpb19jaGFuX3NwZWMgKnRpbWVzdGFtcCA9ICZjaGFubmVsc1tzY2FuX2luZGV4XTsK
PiArCj4gKwkJdGltZXN0YW1wLT50eXBlID0gSUlPX1RJTUVTVEFNUDsKPiArCQl0aW1lc3RhbXAt
PmNoYW5uZWwgPSAtMTsKPiArCQl0aW1lc3RhbXAtPnNjYW5faW5kZXggPSBzY2FuX2luZGV4Owo+
ICsJCXRpbWVzdGFtcC0+c2Nhbl90eXBlLnNpZ24gPSAncyc7Cj4gKwkJdGltZXN0YW1wLT5zY2Fu
X3R5cGUucmVhbGJpdHMgPSA2NDsKPiArCQl0aW1lc3RhbXAtPnNjYW5fdHlwZS5zdG9yYWdlYml0
cyA9IDY0Owo+ICsKPiArCQlzY2FuX2luZGV4Kys7Cj4gKwl9Cj4gKwo+ICAJaW5kaW9fZGV2LT5u
dW1fY2hhbm5lbHMgPSBzY2FuX2luZGV4Owo+ICAJaW5kaW9fZGV2LT5jaGFubmVscyA9IGNoYW5u
ZWxzOwo+ICAKPiBAQCAtMTg3NSw2ICsxODkxLDcgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Cj4gIAlpcnFyZXR1cm5fdCAoKmhhbmRsZXIpKGludCBpcnEsIHZvaWQgKnAp
ID0gTlVMTDsKPiAgCXN0cnVjdCBzdG0zMl9hZGMgKmFkYzsKPiArCWJvb2wgdGltZXN0YW1waW5n
ID0gZmFsc2U7Cj4gIAlpbnQgcmV0Owo+ICAKPiAgCWlmICghcGRldi0+ZGV2Lm9mX25vZGUpCj4g
QEAgLTE5MzEsMTYgKzE5NDgsMTggQEAgc3RhdGljIGludCBzdG0zMl9hZGNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChyZXQgPCAwKQo+ICAJCXJldHVybiByZXQ7
Cj4gIAo+IC0JcmV0ID0gc3RtMzJfYWRjX2NoYW5fb2ZfaW5pdChpbmRpb19kZXYpOwo+IC0JaWYg
KHJldCA8IDApCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gIAlyZXQgPSBzdG0zMl9hZGNfZG1hX3Jl
cXVlc3QoZGV2LCBpbmRpb19kZXYpOwo+ICAJaWYgKHJldCA8IDApCj4gIAkJcmV0dXJuIHJldDsK
PiAgCj4gLQlpZiAoIWFkYy0+ZG1hX2NoYW4pCj4gKwlpZiAoIWFkYy0+ZG1hX2NoYW4pIHsKPiAg
CQloYW5kbGVyID0gJnN0bTMyX2FkY190cmlnZ2VyX2hhbmRsZXI7CgpIaSBBaG1hZCwKCkp1c3Qg
c3VnZ2VzdGluZzogbWF5YmUgYWRkIGEgcXVpY2sgY29tbWVudCB0byBpbmRpY2F0ZSB0aGF0IHRp
bWVzdGFtcGluZwppcyBzdXBwb3J0ZWQgaW4gUElPIG1vZGUgKG9ubHkpLCBhcyBETUEgZG9lc24n
dCBmaWxsIGl0IGludG8gdGhlIGJ1ZmZlcgood2VsbCBkZXNjcmliZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlKS4KCj4gKwkJdGltZXN0YW1waW5nID0gdHJ1ZTsKPiArCX0KPiArCj4gKwlyZXQgPSBz
dG0zMl9hZGNfY2hhbl9vZl9pbml0KGluZGlvX2RldiwgdGltZXN0YW1waW5nKTsKPiArCWlmIChy
ZXQgPCAwKQo+ICsJCXJldHVybiByZXQ7CgoKRE1BIHJlc291cmNlcyBuZWVkIHRvIGJlIGZyZWVk
LCBpbnN0ZWFkIG9mIHJldHVybmluZyBkaXJlY3RseSBoZXJlLCBpbgpjYXNlIG9mIGVycm9yOgoK
wqDCoMKgwqAgZ290byBlcnJfZG1hX2Rpc2FibGU7CgpXaXRoIHRoYXQgZml4ZWQsIHlvdSBjYW4g
YWRkIG15IDoKCkFja2VkLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3Nz
LnN0LmNvbT4KClRoYW5rcywKCkZhYnJpY2UKCgo+ICAKPiAgCXJldCA9IGlpb190cmlnZ2VyZWRf
YnVmZmVyX3NldHVwKGluZGlvX2RldiwKPiAgCQkJCQkgJmlpb19wb2xsZnVuY19zdG9yZV90aW1l
LCBoYW5kbGVyLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
