Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5517F6EC
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2020 12:58:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D24EC36B0D;
	Tue, 10 Mar 2020 11:58:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC392C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 11:58:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ABqhBb001980; Tue, 10 Mar 2020 12:58:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=7PdSQP9uKR51iNtYVitiCEnAIHdj8uJHoRAAyMFEF+A=;
 b=PA6Bxm1MH9uoNGVpvd0UA0ZOnLLatTfG6cCHVl/4/GduExtCzgdJD+SBQyg4DgQs8ikl
 hwnd04UPk1Oi22YgTPhNlqLJ4xvc1EbZa17RFknl/k8xl0nS0f+SGtwsWQrCE+96GBnS
 ssckaewO5YiLVWLmI2aaPA+vAASQsdsH1Kk6dNjnzdrAE8OETgs5QBm0L8A1BASKzldH
 yHjP6Zzk+Y3OQTHPz0+t6SV0k57UPmPA48h60Ovkj2Fk72wKvGR1y3O2ZLhqJmLFcv5v
 P55JJOMOS3C2RjdfZr4tDJ/LK+2R+QHrjR4kQo15kJIRxMW3CI4tB9l0ei4E8/lkBCI/ PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym292b4eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 12:58:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14ED9100038;
 Tue, 10 Mar 2020 12:58:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D42302A971D;
 Tue, 10 Mar 2020 12:58:41 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar 2020 12:58:41
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
Date: Tue, 10 Mar 2020 12:58:41 +0100
Message-ID: <1583841521-27897-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_06:2020-03-10,
 2020-03-10 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] i2c: stm32f7: do not backup read-only PECR
	register
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

VGhlIFBFQ1IgcmVnaXN0ZXIgcHJvdmlkZXMgcmVjZWl2ZWQgcGFja2V0IGNvbXB1dGVkIFBFQyB2
YWx1ZS7CoApJdCBtYWtlcyBubyBzZW5zZSByZXN0b3JpbmcgaXRzIHZhbHVlIGFmdGVyIGEgcmVz
ZXQsIGFuZCBhbnl3YXksCmFzIHJlYWQtb25seSByZWdpc3RlciBpdCBjYW5ub3QgYmUgcmVzdG9y
ZWQuCgpGaXhlczogZWE2ZGQyNWRlZWI1ICgiaTJjOiBzdG0zMmY3OiBhZGQgUE1fU0xFRVAgc3Vz
cGVuZC9yZXN1bWUgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEFsYWluIFZvbG1hdCA8YWxhaW4u
dm9sbWF0QHN0LmNvbT4KUmV2aWV3ZWQtYnk6IFBpZXJyZS1ZdmVzIE1PUkRSRVQgPHBpZXJyZS15
dmVzLm1vcmRyZXRAc3QuY29tPgotLS0KdjI6IHJlYmFzZSBvbiB0b3Agb2Ygb3RoZXIgaTJjLXN0
bTMyZjcgcGF0Y2hlcyBpbnRlZ3JhdGVkIHdpdGhpbiBpMmMtbmV4dAoKIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCmluZGV4IDhmZTdmOGNhZjkxYi4uNjQxOGY1OTgy
ODk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYworKysgYi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwpAQCAtMTc2LDcgKzE3Niw2IEBACiAgKiBA
Y3IyOiBDb250cm9sIHJlZ2lzdGVyIDIKICAqIEBvYXIxOiBPd24gYWRkcmVzcyAxIHJlZ2lzdGVy
CiAgKiBAb2FyMjogT3duIGFkZHJlc3MgMiByZWdpc3RlcgotICogQHBlY3I6IFBFQyByZWdpc3Rl
cgogICogQHRtZ3I6IFRpbWluZyByZWdpc3RlcgogICovCiBzdHJ1Y3Qgc3RtMzJmN19pMmNfcmVn
cyB7CkBAIC0xODQsNyArMTgzLDYgQEAgc3RydWN0IHN0bTMyZjdfaTJjX3JlZ3MgewogCXUzMiBj
cjI7CiAJdTMyIG9hcjE7CiAJdTMyIG9hcjI7Ci0JdTMyIHBlY3I7CiAJdTMyIHRtZ3I7CiB9Owog
CkBAIC0yMTk2LDcgKzIxOTQsNiBAQCBzdGF0aWMgaW50IHN0bTMyZjdfaTJjX3JlZ3NfYmFja3Vw
KHN0cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYpCiAJYmFja3VwX3JlZ3MtPmNyMiA9IHJl
YWRsX3JlbGF4ZWQoaTJjX2Rldi0+YmFzZSArIFNUTTMyRjdfSTJDX0NSMik7CiAJYmFja3VwX3Jl
Z3MtPm9hcjEgPSByZWFkbF9yZWxheGVkKGkyY19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19PQVIx
KTsKIAliYWNrdXBfcmVncy0+b2FyMiA9IHJlYWRsX3JlbGF4ZWQoaTJjX2Rldi0+YmFzZSArIFNU
TTMyRjdfSTJDX09BUjIpOwotCWJhY2t1cF9yZWdzLT5wZWNyID0gcmVhZGxfcmVsYXhlZChpMmNf
ZGV2LT5iYXNlICsgU1RNMzJGN19JMkNfUEVDUik7CiAJYmFja3VwX3JlZ3MtPnRtZ3IgPSByZWFk
bF9yZWxheGVkKGkyY19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19USU1JTkdSKTsKIAlzdG0zMmY3
X2kyY193cml0ZV9mbV9wbHVzX2JpdHMoaTJjX2RldiwgZmFsc2UpOwogCkBAIC0yMjI5LDcgKzIy
MjYsNiBAQCBzdGF0aWMgaW50IHN0bTMyZjdfaTJjX3JlZ3NfcmVzdG9yZShzdHJ1Y3Qgc3RtMzJm
N19pMmNfZGV2ICppMmNfZGV2KQogCXdyaXRlbF9yZWxheGVkKGJhY2t1cF9yZWdzLT5jcjIsIGky
Y19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19DUjIpOwogCXdyaXRlbF9yZWxheGVkKGJhY2t1cF9y
ZWdzLT5vYXIxLCBpMmNfZGV2LT5iYXNlICsgU1RNMzJGN19JMkNfT0FSMSk7CiAJd3JpdGVsX3Jl
bGF4ZWQoYmFja3VwX3JlZ3MtPm9hcjIsIGkyY19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19PQVIy
KTsKLQl3cml0ZWxfcmVsYXhlZChiYWNrdXBfcmVncy0+cGVjciwgaTJjX2Rldi0+YmFzZSArIFNU
TTMyRjdfSTJDX1BFQ1IpOwogCXN0bTMyZjdfaTJjX3dyaXRlX2ZtX3BsdXNfYml0cyhpMmNfZGV2
LCB0cnVlKTsKIAogCXBtX3J1bnRpbWVfcHV0X3N5bmMoaTJjX2Rldi0+ZGV2KTsKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
