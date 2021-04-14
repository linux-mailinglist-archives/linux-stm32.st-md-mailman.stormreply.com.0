Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50235F475
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 15:03:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9AB7C57B78;
	Wed, 14 Apr 2021 13:03:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3DE3C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 13:03:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13ED3YIl029133; Wed, 14 Apr 2021 15:03:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WwyhOomJmwutrJbMMnWKe5Zzis82DOmKJvlisKhNjoQ=;
 b=rSdRTWMn5+Fd1h0LexopnJ5ivrThXPnhiO3kZWgl4x8V28CNDVDYmwbHbh1s2Ncow4bX
 Z6TYNTO/HD2QnfLmlh9RPSEzXRH6ITnXn+X3tzceXdSGelqxr77frhbrFj51IlTFESxh
 UUkTGbXe1C/5dUXl1Qwdu0JAEWVgoQUpz2GnUixALVXjwyQaLCNKpp0ZUIByWvJzGfJ6
 /AUZXFsu5WtSTLRT/rS3yfA+4E//eSGHBrdtC76L77PkluHGXFhUc4cmbP9vIM87CLvD
 7DFV4LA2B5zZ4Ozgd4hTbrvnunHGUjBfd93tE9n3Be6miHmrpD2AGSS4AUb2O9QoczK6 gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37wr0xudqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 15:03:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5A0210002A;
 Wed, 14 Apr 2021 15:03:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A6B5237C65;
 Wed, 14 Apr 2021 15:03:38 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 15:03:37 +0200
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
Message-ID: <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
Date: Wed, 14 Apr 2021 15:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408185731.135511-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWssCgpUaGFua3MgZm9yIHRoZSBwYXRjaHNldAoKT24gNC84LzIxIDg6NTcgUE0sIE1h
cmVrIFZhc3V0IHdyb3RlOgo+IFRoZSBFVEhDS19LIGFyZSBtb2RlbGVkIGFzIGNvbXBvc2l0ZSBj
bG9jayBvZiBNVVggYW5kIEdBVEUsIGhvd2V2ZXIgcGVyCj4gU1RNMzJNUDEgUmVmZXJlbmNlIE1h
bnVhbCBSTTA0MzYgUmV2IDMsIFBhZ2UgNTc0LCBGaWd1cmUgODMuIFBlcmlwaGVyYWwKPiBjbG9j
ayBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0LCBFVEhQVFBESVYgZGl2aWRlciBpcyBhdHRhY2hl
ZCBwYXN0IHRoZQo+IEVUSENLX0sgbXV4LCBhbmQgRVRIX0NMSy9ldGhfY2xrX2ZiIGNsb2NrIGFy
ZSBvdXRwdXQgcGFzdCBFVEhDS0VOIGdhdGUuCj4gVGhlcmVmb3JlLCBpbiBjYXNlIEVUSF9DTEsv
ZXRoX2Nsa19mYiBhcmUgbm90IGluIHVzZSBBTkQgUFRQIGNsb2NrIGFyZQo+IGluIHVzZSwgRVRI
Q0tFTiBnYXRlIGNhbiBiZSB0dXJuZWQgb2ZmLiBDdXJyZW50IGRyaXZlciBkb2VzIG5vdCBwZXJt
aXQKPiB0aGF0LCBmaXggaXQuCgpJIGRvbiJ0IHVuZGVyc3RhbmQsIGl0J3MgYWxyZWFkeSB0aGUg
Y2FzZS4KCkVUSENLX0sgaXQncyBhIGNvbXBvc2l0ZSB3aXRoIGEgTVVYIGFuZCBhIEdBVEUuCgpF
VEhQVFBfSyAoRVRIUFRQRElWKSBpdCdzIGEgY29tcG9zaXRlIHdpdGggdGhlIHNhbWUgTVVYIGFu
ZCBhIERJViAobm8gZ2F0ZSkKCklmIHlvdSB1c2Ugb25seSBFVEhQVFBESVYswqAgRVRIQ0tFTiBn
YXRlIGNhbiBiZSB0dXJuZWQgb2ZmLgoKICAKCj4gVGhpcyBwYXRjaCBjb252ZXJ0cyBFVEhDS19L
IGZyb20gY29tcG9zaXRlIGNsb2NrIGludG8gYSBFVEhDS0VOIGdhdGUsCj4gRVRIUFRQX0sgZnJv
bSBjb21wb3NpdGUgY2xvY2sgaW50byBFVEhQVFBESVYgZGl2aWRlciwgYW5kIGFkZHMgYW5vdGhl
cgo+IE5PX0lEIGNsb2NrICJja19rZXJfZXRoIiB3aGljaCBtb2RlbHMgdGhlIEVUSFNSQyBtdXgg
YW5kIGlzIHBhcmVudCBjbG9jawo+IHRvIGJvdGggRVRIQ0tfSyBhbmQgRVRIUFRQX0suIFRoZXJl
Zm9yZSwgYWxsIHJlZmVyZW5jZXMgdG8gRVRIQ0tfSyBhbmQKPiBFVEhQVFBfSyByZW1haW4gZnVu
Y3Rpb25hbCBhcyBiZWZvcmUuCj4KPiBbMV0gU1RNMzJNUDEgUmVmZXJlbmNlIE1hbnVhbCBSTTA0
MzYgUmV2IDMsIFBhZ2UgNTc0LAo+ICAgICAgRmlndXJlIDgzLiBQZXJpcGhlcmFsIGNsb2NrIGRp
c3RyaWJ1dGlvbiBmb3IgRXRoZXJuZXQKPiAgICAgIGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJj
ZS9lbi9yZWZlcmVuY2VfbWFudWFsL2RtMDAzMjc2NTktc3RtMzJtcDE1Ny1hZHZhbmNlZC1hcm1i
YXNlZC0zMmJpdC1tcHVzLXN0bWljcm9lbGVjdHJvbmljcy5wZGYKPgo+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWU8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogQ2hyaXN0b3BoZSBSb3VsbGllcjxjaHJpc3Rv
cGhlLnJvdWxsaWVyQGZvc3Muc3QuY29tPgo+IENjOiBHYWJyaWVsIEZlcm5hbmRlejxnYWJyaWVs
LmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljZSBDaG90YXJkPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heTxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgo+IENjOiBTdGVwaGVuIEJveWQ8c3dib3lkQGNocm9taXVtLm9yZz4KPiBD
YzpsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnCj4gQ2M6bGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQo+IFRvOmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IC0tLQo+ICAgZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMgfCAxMCArKysrKysrLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jIGIvZHJpdmVycy9jbGsvY2xrLXN0
bTMybXAxLmMKPiBpbmRleCBhODc1NjQ5ZGY4YjguLmE3YzdmNTQ0ZWU1ZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2Nsay9jbGstc3RtMzJtcDEuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0z
Mm1wMS5jCj4gQEAgLTE5NDksNyArMTk0OSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xvY2tf
Y29uZmlnIHN0bTMybXAxX2Nsb2NrX2NmZ1tdID0gewo+ICAgCUtDTEsoRFNJX0ssICJkc2lfayIs
IGRzaV9zcmMsIDAsIEdfRFNJLCBNX0RTSSksCj4gICAJS0NMSyhBREZTRE1fSywgImFkZnNkbV9r
Iiwgc2FpX3NyYywgMCwgR19BREZTRE0sIE1fU0FJMSksCj4gICAJS0NMSyhVU0JPX0ssICJ1c2Jv
X2siLCB1c2JvX3NyYywgMCwgR19VU0JPLCBNX1VTQk8pLAo+IC0JS0NMSyhFVEhDS19LLCAiZXRo
Y2tfayIsIGV0aF9zcmMsIDAsIEdfRVRIQ0ssIE1fRVRIQ0spLAo+ICAgCj4gICAJLyogUGFydGlj
dWxhcnkgS2VybmVsIENsb2NrcyAobm8gbXV4IG9yIG5vIGdhdGUpICovCj4gICAJTUdBVEVfTVAx
KERGU0RNX0ssICJkZnNkbV9rIiwgImNrX21jdSIsIDAsIEdfREZTRE0pLAo+IEBAIC0xOTU4LDEx
ICsxOTU3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xvY2tfY29uZmlnIHN0bTMybXAxX2Ns
b2NrX2NmZ1tdID0gewo+ICAgCU1HQVRFX01QMShHUFVfSywgImdwdV9rIiwgInBsbDJfcSIsIDAs
IEdfR1BVKSwKPiAgIAlNR0FURV9NUDEoREFDMTJfSywgImRhYzEyX2siLCAiY2tfbHNpIiwgMCwg
R19EQUMxMiksCj4gICAKPiAtCUNPTVBPU0lURShFVEhQVFBfSywgImV0aHB0cF9rIiwgZXRoX3Ny
YywgQ0xLX09QU19QQVJFTlRfRU5BQkxFIHwKPiArCUNPTVBPU0lURShOT19JRCwgImNrX2tlcl9l
dGgiLCBldGhfc3JjLCBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgfAo+ICAgCQkgIENMS19TRVRfUkFU
RV9OT19SRVBBUkVOVCwKPiAgIAkJICBfTk9fR0FURSwKPiAgIAkJICBfTU1VWChNX0VUSENLKSwK
PiAtCQkgIF9ESVYoUkNDX0VUSENLU0VMUiwgNCwgNCwgMCwgTlVMTCkpLAo+ICsJCSAgX05PX0RJ
ViksCj4gKwo+ICsJTUdBVEVfTVAxKEVUSENLX0ssICJldGhja19rIiwgImNrX2tlcl9ldGgiLCAw
LCBHX0VUSENLKSwKYXNzaWduZWQgcGFyZW50IHdpdGggRVRIQ0tfSyB3aWxsIG5vdCB3b3JrCj4g
Kwo+ICsJRElWKEVUSFBUUF9LLCAiZXRocHRwX2siLCAiY2tfa2VyX2V0aCIsIENMS19PUFNfUEFS
RU5UX0VOQUJMRSB8CgpDTEtfT1BTX1BBUkVOVF9FTkFCTEUgZmxhZ3Mgbm90IHVzZWZ1bCB3aXRo
IGEgZGl2aWRlci4KCmJlc3QgcmVnYXJkcwoKR2FicmllbAoKPiArCSAgICBDTEtfU0VUX1JBVEVf
Tk9fUkVQQVJFTlQsIFJDQ19FVEhDS1NFTFIsIDQsIDQsIDApLAo+ICAgCj4gICAJLyogUlRDIGNs
b2NrICovCj4gICAJRElWKE5PX0lELCAiY2tfaHNlX3J0YyIsICJja19oc2UiLCAwLCBSQ0NfUlRD
RElWUiwgMCwgNiwgMCksCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
