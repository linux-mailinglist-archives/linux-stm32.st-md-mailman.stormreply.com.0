Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55F2FBE5F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jan 2021 18:57:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 104F0C3FADA;
	Tue, 19 Jan 2021 17:57:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2477BC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jan 2021 17:57:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10JHm10P016045; Tue, 19 Jan 2021 18:56:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5WYFGtdY+KCjXDAhcbztWKsr83wJ4tyifcNDQMaEHjk=;
 b=jpOQy+1g4mLwJN4aLOIXIg0FOR0UTggpirNgSbWbLGg+F0kMNkqb90wQIOQpn/uWdaxJ
 k0PtDvfzly8rLeknLJIdcKbDQT9hp8HXdp2SRoN38lOtfelmTRmloqtbQLAiPLI7S0+H
 XyrBoZ7f2QPbw2whmOYxp6X4DWEUTJHkuvi/0IvZ6uHvkLYLxa/guPQbSlbBhRXuDLQp
 CLarBPgMFsm3FfEzAEtbq8TkeoxiP4sDjnc3zWC7VbA7P2YTdJT+LEDgSJcpIvO14GQY
 wmTTuA4+8f0AHq7A+UruFbn7dE0ZCTxBxPCmPyk8pRGqnwoqFLUjEGVwo4UviU/Zz3vQ Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 363qwnj2eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 18:56:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E83CF10002A;
 Tue, 19 Jan 2021 18:56:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D059D25D01B;
 Tue, 19 Jan 2021 18:56:57 +0100 (CET)
Received: from [10.211.11.124] (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 18:56:56 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Jonathan Cameron
 <jic23@kernel.org>, Olivier Moysan <olivier.moysan@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <20210112152441.20665-1-a.fatoum@pengutronix.de>
 <20210116175333.4d8684c5@archlinux>
 <47b0905a-4496-2f21-3b17-91988aa88e91@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <7668b126-d77c-7339-029f-50333d03fbd9@foss.st.com>
Date: Tue, 19 Jan 2021 18:56:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47b0905a-4496-2f21-3b17-91988aa88e91@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_07:2021-01-18,
 2021-01-19 signatures=0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Holger Assmann <has@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Thomas Gleixner <tglx@linutronix.de>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix erroneous
 handling of spurious IRQs
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

T24gMS8xOC8yMSAxMjo0MiBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxvIEpvbmF0aGFu
LAo+Cj4gT24gMTYuMDEuMjEgMTg6NTMsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4+IE9uIFR1
ZSwgMTIgSmFuIDIwMjEgMTY6MjQ6NDIgKzAxMDAKPj4gQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4+Cj4+PiAxYzZjNjk1MjViNDAgKCJnZW5pcnE6IFJlamVj
dCBib2d1cyB0aHJlYWRlZCBpcnEgcmVxdWVzdHMiKSBtYWtlcyBzdXJlCj4+PiB0aGF0IHRocmVh
ZGVkIElSUXMgZWl0aGVyCj4+PiAgIC0gaGF2ZSBJUlFGX09ORVNIT1Qgc2V0Cj4+PiAgIC0gZG9u
J3QgaGF2ZSB0aGUgZGVmYXVsdCBqdXN0IHJldHVybiBJUlFfV0FLRV9USFJFQUQgcHJpbWFyeSBo
YW5kbGVyCj4+Pgo+Pj4gVGhpcyBpcyBuZWNlc3NhcnkgYmVjYXVzZSBsZXZlbC10cmlnZ2VyZWQg
aW50ZXJydXB0cyBuZWVkIHRvIGJlIG1hc2tlZCwKPj4+IGVpdGhlciBhdCBkZXZpY2Ugb3IgaXJx
Y2hpcCwgdG8gYXZvaWQgYW4gaW50ZXJydXB0IHN0b3JtLgo+Pj4KPj4+IEZvciBzcHVyaW91cyBp
bnRlcnJ1cHRzLCB0aGUgU1RNMzIgQURDIGRyaXZlciBzdGlsbCBkb2VzIHRoaXMgYm9ndXMKPj4+
IHJlcXVlc3QgdGhvdWdoOgo+Pj4gICAtIEl0IGRvZXNuJ3Qgc2V0IElSUUZfT05FU0hPVAo+Pj4g
ICAtIEl0cyBwcmltYXJ5IGhhbmRsZXIganVzdCByZXR1cm5zIElSUV9XQUtFX1RIUkVBRCBpZiB0
aGUgaW50ZXJydXB0Cj4+PiAgICAgaXMgdW5leHBlY3RlZCwgaS5lLiAhKHN0YXR1cyAmIGVuYWJs
ZWRfbWFzaykKPj4gVGhpcyBzZWVtcyAndW51c3VhbCcuICBJZiB0aGlzIGlzIGEgc3B1cmlvdXMg
aW50ZXJydXB0IHdlIHNob3VsZCBiZQo+PiByZXR1cm5pbmcgSVJRX05PTkUgYW5kIGxldHRpbmcg
dGhlIHNwdXJpb3VzIGludGVycnVwdCBwcm90ZWN0aW9uCj4+IHN0dWZmIGtpY2sgaW4uCj4+Cj4+
IFRoZSBvbmx5IHJlYXNvbiBJIGNhbiBzZWUgdGhhdCBpdCBkb2VzIHRoaXMgaXMgcHJpbnQgYW4g
ZXJyb3IgbWVzc2FnZS4KPj4gSSdtIG5vdCBzdXJlIHdoeSB3ZSBuZWVkIHRvIGdvIGludG8gdGhl
IHRocmVhZCB0byBkbyB0aGF0IGdpdmVuCj4+IGl0J3Mgbm90IHN1cHBvc2VkIHRvIGhhcHBlbi4g
SWYgd2UgbmVlZCB0aGF0IG1lc3NhZ2UgYXQgYWxsLCBJJ2QKPj4gc3VnZ2VzdCBkb2luZyBpdCBp
biB0aGUgaW50ZXJydXB0IGhhbmRsZXIgdGhlbiByZXR1cm4gSVJRX05PTkU7Cj4gQXMgZGVzY3Jp
YmVkLCBJIHJ1biBpbnRvIHRoZSBzcHVyaW91cyBJUlEgY2FzZSwgc28gSSB0aGluayB0aGUgbWVz
c2FnZSBpcwo+IHN0aWxsIHVzZWZ1bCAodW50aWwgdGhhdCdzIHByb3Blcmx5IGZpeGVkKSwgYnV0
IHllcywgaXQgc2hvdWxkJ3ZlIHJldHVybmVkCj4gSVJRX05PTkUgaW4gdGhhdCBjYXNlLgo+Cj4g
V2l0aCB0aGVzZSBjaGFuZ2VzLCBJUlFGX09ORVNIT1Qgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeSwg
YnV0IGluIHByYWN0aWNlCj4gdGhlIGRyaXZlciBkb2Vzbid0IGZ1bmN0aW9uIGNvcnJlY3RseSB3
aXRoIHRoZSBwcmltYXJ5IElSUSBoYW5kbGVyIHRocmVhZGVkLgo+Cj4gT2xpdmllciwgRmFicmlj
ZTogQXJlIHlvdSBhd2FyZSBvZiB0aGlzIHByb2JsZW0/CgoKSGkgQWhtYWQsIEpvbmF0aGFuLAoK
SSB3YXNuJ3QgYXdhcmUgb2YgdGhpcyB1cCB0byBub3cuIEkgY29uZmlybSB3ZSd2ZSB0aGUgc2Ft
ZSBiZWhhdmlvciBhdApvdXIgZW5kIHdpdGggdGhyZWFkaXJxcz0xLgoKT2xpdmllciBhbmQgSSBz
dGFydGVkIHRvIGxvb2sgYXQgdGhpcy4gSW5kZWVkLCB0aGUgSVJRRl9PTkVTSE9UIG1ha2VzCnRo
ZSBpc3N1ZSB0byBkaXNhcHBlYXIuCkknbSBub3Qgc3VyZSAxMDAlIHRoYXQncyBmb3IgdGhlIGFi
b3ZlIHJlYXNvbnMuIFBsZWFzZSBsZXQgbWUgc2hhcmUgc29tZQpwaWVjZSBvZiBsb2dzLCBhbmFs
eXNpcyBhbmQgdGhvdWdodHMuCgoKSSBtYXkgbWlzcyBpdCBidXQsIHRoZSBwYXRjaCAiZ2VuaXJx
OiBSZWplY3QgYm9ndXMgdGhyZWFkZWQgaXJxCnJlcXVlc3RzIiBzZWVtcyB0byBoYW5kbGUgdGhl
IGNhc2Ugd2hlcmUgbm8gSFcgaGFuZGxlciBpcyBwcm92aWRlZCwgYnV0Cm9ubHkgdGhlIHRocmVh
ZGVkIHBhcnQ/CgpJbiB0aGUgc3RtMzItYWRjIGJvdGggYXJlIHByb3ZpZGVkLiBBbHNvIHRoZSBJ
UlEgZG9tYWluIGluCnN0bTMyLWFkYy1jb3JlIG1heWJlIGEga2V5IGhlcmUgPwoKCldlIGRpZCBz
b21lIHRlc3RpbmcsIGZ0cmFjZSBhbmQgb2JzZXJ2ZWQgZm9sbG93aW5nIGJlaGF2aW9yIGZvciBv
bmUKY2FwdHVyZSAoYSBzaW5nbGUgY2F0IGluX3ZvbHRhZ2UuLi5fcmF3KSA6CgppbiBzdG0zMi1h
ZGMtY29yZSwgYXMgSVJRIHNvdXJjZSBpcyBzdGlsbCBhY3RpdmUgdW50aWwgdGhlIElSUSB0aHJl
YWQKY2FuIGV4ZWN1dGU6Ci0gc3RtMzJfYWRjX2lycV9oYW5kbGVyIDwtLSBnZW5lcmljX2hhbmRs
ZV9pcnEKLSBzdG0zMl9hZGNfaXJxX2hhbmRsZXIgPC0tIGdlbmVyaWNfaGFuZGxlX2lycQotIHN0
bTMyX2FkY19pcnFfaGFuZGxlciA8LS0gZ2VuZXJpY19oYW5kbGVfaXJxCi4uLgoKLSBzY2hlZF9z
d2l0Y2ggdG8gdGhlIDFzdCBJUlEgdGhyZWFkCi0gc3RtMzJfYWRjX2lycV9oYW5kbGVyIDwtLSBn
ZW5lcmljX2hhbmRsZV9pcnEgKGFnYWluIHVudGlsIERSIGdldCByZWFkKQoKLSBzdG0zMl9hZGNf
aXNyIDwtLSBpcnFfZm9yY2VkX3RocmVhZF9mbiAoZnJvbSBzdG0zMi1hZGMpCsKgIERSIHJlYWQs
IGNsZWFycyB0aGUgYWN0aXZlIGZsYWcKLSBzdG0zMl9hZGNfaXNyIDwtLSBpcnFfZm9yY2VkX3Ro
cmVhZF9mbgrCoCB3YWtlcyB0aGUgMm5kIElSUSB0aHJlYWQgdG8gcHJpbnQgYW4gZXJyb3IgKHVu
ZXhwZWN0ZWQuLi4pCgpzY2hlZF9zd2l0Y2ggdG8gdGhlIDJuZCBJUlEgdGhyZWFkIHRoYXQgcHJp
bnRzIHRoZSBtZXNzYWdlLgoKLSBzdG0zMl9hZGNfdGhyZWFkZWRfaXNyIDwtLSBpcnFfdGhyZWFk
X2ZuCgoKU28gbXkgdW5kZXJzdGFuZGluZyBpczogdGhlIGNhdXNlIHNlZW1zIHRvIGJlIHRoZSBj
b25jdXJyZW5jeSBiZXR3ZWVuCgotIHN0bTMyX2FkY19pcnFfaGFuZGxlcigpIHN0b3JtIGNhbGxz
IGluIHN0bTMyLWFkYy1jb3JlCi0gc3RtMzJfYWRjX2lzcigpIGNhbGwgdG8gY2xlYXIgdGhlIGNh
dXNlIChmb3JjZWQgaW50byBhIHRocmVhZCB3aXRoCnRocmVhZGlycXM9MSkuCgpUbyBwcm9wZXJs
eSB3b3JrLCB0aGUgc3RtMzJfYWRjX2lycV9oYW5kbGVyKCkgc2hvdWxkIGJlIG1hc2tlZCBpbiBi
ZXR3ZWVuLgoKQXMgeW91IGV4cGxhaW4sIHRoaXMgd29ya3MgaW4gdGhpcyBjYXNlOiB0aGUgY2Fs
bCB0byBzdG0zMl9hZGNfaXNyIChpbgpzdG0zMi1hZGMpIGlzbid0IGxvbmdlciBmb3JjZWQgdGhy
ZWFkZWQgd2l0aCBJUlFGX09ORVNIT1QuCgpJdCBsb29rcyBsaWtlIElSUUZfTk9fVEhSRUFEIGZv
ciBmb3JjZWQgdGhyZWFkaW5nIHdvdWxkIGhhdmUgc2ltaWxhcgplZmZlY3Q/IE1heWJlIHRoZSBz
YW1lIHdvdWxkIGJlIGFwcGxpY2FibGUgaGVyZSA/IChJIGhhdmVuJ3QgdGVzdGVkLi4uKQoKCkhv
cGVmdWxseSB0aGlzIGhlbHBzIGFuZCBpcyBzaW1pbGFyIHRvIHdoYXQgeW91IG9ic2VydmVkLgoK
VGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsCkZhYnJpY2UKCj4KPiBDaGVlcnMsCj4gQWhtYWQKPgo+
Pj4gICAtIHN0bTMybXAxNTEuZHRzaSBkZXNjcmliZXMgdGhlIEFEQyBpbnRlcnJ1cHQgYXMgbGV2
ZWwtdHJpZ2dlcmVkCj4+Pgo+Pj4gRml4IHRoaXMgYnkgc2V0dGluZyBJUlFGX09ORVNIT1QgdG8g
aGF2ZSB0aGUgaXJxY2hpcCBtYXNrIHRoZSBJUlEKPj4+IHVudGlsIHRoZSBJUlEgdGhyZWFkIGhh
cyBmaW5pc2hlZC4KPj4+Cj4+PiBJUlFGX09ORVNIT1QgYWxzbyBoYXMgdGhlIGVmZmVjdCB0aGF0
IHRoZSBwcmltYXJ5IGhhbmRsZXIgaXMgbm8gbG9uZ2VyCj4+PiBmb3JjZWQgaW50byBhIHRocmVh
ZC4gVGhpcyBtYWtlcyB0aGUgaXNzdWUgd2l0aCBzcHVyaW91cyBpbnRlcnJ1cHRzCj4+PiBpbnRl
cnJ1cHRzIGRpc2FwcGVhciB3aGVuIHJlYWRpbmcgdGhlIEFEQyBvbiBhIHRocmVhZGlycXM9MSBr
ZXJuZWwuCj4+PiBUaGlzIHVzZWQgdG8gcmVzdWx0IGluIGZvbGxvd2luZyBrZXJuZWwgZXJyb3Ig
bWVzc2FnZToKPj4+Cj4+PiAJaWlvIGlpbzpkZXZpY2UxOiBVbmV4cGVjdGVkIElSUTogSUVSPTB4
MDAwMDAwMDAsIElTUj0weDAwMDAxMDBlCj4+PiBvcgo+Pj4gCWlpbyBpaW86ZGV2aWNlMTogVW5l
eHBlY3RlZCBJUlE6IElFUj0weDAwMDAwMDA0LCBJU1I9MHgwMDAwMTAwYQo+Pj4KPj4+IEJ1dCB3
aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCAob3IgdGhyZWFkZWQgSVJRcyBkaXNhYmxlZCksIHRoaXMg
bm8gbG9uZ2VyCj4+PiBvY2N1cnMuCj4+Pgo+Pj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPgo+Pj4gUmVwb3J0ZWQtYnk6IEhvbGdlciBBc3NtYW5uIDxoYXNAcGVuZ3V0
cm9uaXguZGU+Cj4+PiBGaXhlczogNjk1ZTJmNWMyODliICgiaWlvOiBhZGM6IHN0bTMyLWFkYzog
Zml4IGEgcmVncmVzc2lvbiB3aGVuIHVzaW5nIGRtYSBhbmQgaXJxIikKPj4+IFNpZ25lZC1vZmYt
Ynk6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+Cj4+PiAtLS0KPj4+ICBk
cml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMgfCAyICstCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aWlvL2FkYy9zdG0zMi1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYwo+Pj4gaW5k
ZXggYzA2N2M5OTRkYWUyLi43ZTBlMjFjNzlhYzggMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lp
by9hZGMvc3RtMzItYWRjLmMKPj4+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYwo+
Pj4gQEAgLTE5MTAsNyArMTkxMCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAgCj4+PiAgCXJldCA9IGRldm1fcmVxdWVzdF90
aHJlYWRlZF9pcnEoJnBkZXYtPmRldiwgYWRjLT5pcnEsIHN0bTMyX2FkY19pc3IsCj4+PiAgCQkJ
CQlzdG0zMl9hZGNfdGhyZWFkZWRfaXNyLAo+Pj4gLQkJCQkJMCwgcGRldi0+bmFtZSwgaW5kaW9f
ZGV2KTsKPj4+ICsJCQkJCUlSUUZfT05FU0hPVCwgcGRldi0+bmFtZSwgaW5kaW9fZGV2KTsKPj4+
ICAJaWYgKHJldCkgewo+Pj4gIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlcXVl
c3QgSVJRXG4iKTsKPj4+ICAJCXJldHVybiByZXQ7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
