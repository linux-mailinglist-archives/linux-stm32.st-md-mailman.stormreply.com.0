Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDb+N12qkWkrlQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Feb 2026 12:13:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647813E906
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Feb 2026 12:13:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87F9C87ED2;
	Sun, 15 Feb 2026 11:06:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 677C3C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Feb 2026 11:06:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61F50Dln061917
 for <linux-stm32@st-md-mailman.stormreply.com>; Sun, 15 Feb 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT
 5nxT2auI=; b=S+XsWXtNwq8KK4YXODBXvTA5hKPUNWG6nwUU3T0pjsMNAQTH6dY
 ZdE1pl9ceKZYKmugtQawlKT4wI47oTgXiCmEIVReXm25gGSkeSWJwQI6BDd4u/MR
 xRnjxlpzRs84j+TDjfamMoT+Sas4lQQc+wRqSe6WQShjzQkNZ8mEg+6EFgq8rt+c
 22JmorGW4Q4cKLYb7KJiYQCXkel9P5Sa1Iav3dcQBvFT2Ln7nXoDNZXRG8H1MZ/B
 Jv2vyaAJP3zbk2gUfurCOaYoZGMxqmwOCuBgZpy9qkhMHG31CZf8MwUg4hs8/18Z
 5kAd2RJk0MEn8qQvB+bTkguUmgYWNIAwkWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bugere-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Feb 2026 11:06:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb5359e9d3so524331985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Feb 2026 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771153592; x=1771758392;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT5nxT2auI=;
 b=AMRPdRpP904s82xez/APTjidk47ci2z4FQebxd/Q3tX5RaaZWom0yIkMj6lOckZ6X9
 JOWrg0W8l8J5+8rlQljE9g3VFTqyZRh6Zhhc/LoldLo5rGZ088qEwQm9x4i0uYDie/i1
 IZOKFjjwWW0CBeY9s2xHpGQDfc7hOsS8SUd7zUzVh2aDaJ6qaG1yn9vus2l5gJJS9o4R
 natDttUOcqGM6SQloHqUcx7Y4Rw60D0P3rAPX/znGpa487wMxMwySAaFx2mDpU+yn8E9
 JuY1huooUs4Xz7F9LyBerIIrIT7Nlq9fDPpqsb5DBVq7L7xnMZKCIfBoMWXFL09Xs2Nr
 RrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771153592; x=1771758392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ld1npyEylhh9T/ZrLUK2KA2uppN+ES3kJsT5nxT2auI=;
 b=j9MufVnja34MZrMUvwd3zqo9zOVVkoi94h6DcTcgQdS0gN/cc76y+9j3Rulyl4MW1G
 R9zqmmHF3YErda+Ujaqs5W8tM1ncVz5QRuMp2qMgIGquP9I3baMi7VB98xRWfFaHCNzv
 2Yj7nre8gnMe9UhGJM3CfbfK/2NFvTa7n3iYusiZjlmaCDY9x6ytxE0yXFjxxtYAzp9D
 DVp2ooc8s0pohyy863P3kmhYf0WZtfh18TTDmWRf4RF/BcBLGW0RkGfT0MO7+brr+gMl
 S3+gluegEnB6azMia7NYYYoKH81me2At8DQOSCmqsZuK73OJm3NdWTUKUa9bLdi963Qc
 0kyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrAk1TI2+qrQ815IRSzFOIIpBwmZ2iN5klfV//n61P7YxlaEXKhF7IJuFhvqadj5TgdAEcUzYrmCtdWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3478khNfFEt6OLLM71s5R+rbSdjtMRJH5FZxqUCjf3yKPk1Oi
 3IE4U5IwYCf0ioD9JeUmhHcCfIyvpElZbEtcsO4iKmM3VweUMeTAAH43xRMX6E/XjUBy0g86BjN
 HieIm81rskoriukWZcIxfCgWfjAk1nwY9Q7RtkdAU3Z+77dVX8CCf+B2YDkA+TUqIEMGTE3XZNu
 BgN5T0SYk=
X-Gm-Gg: AZuq6aI8TSvfcEUOwVFJoBSR9zb/TE0eLa7AZ/TBZm7UVWFXTnxD3LSlo0+LjspKzTz
 Q54xMzlbGqC95/snwP+DNqNAa/BMZyVuyLLaEj4DYED0qif1trfwi19+vARJjH4FJhtaau69RWV
 A8s3Mk+KLjFJi+MoNfsVdfFAxpNYpk9RUvG++IiYiN6aAFsUs7sFbWrqswmIyBh5iqrpOBnxaAv
 NRlcApOJBsYdDCTlRLMOI5skAnhNFTrhKvIbZRBJznJOELru8o3z/AGp1h/scGPIKsHLuTyK3qj
 +cPL9qx45MtV1rN1D+gXT6O1hCpOyk4RG9HFRUKG5rfpRqW9AnqEwmCfSuKF0EH1viJrtqdJSDz
 p+PaKryL6n8gJR69jAnBhistf2yv8isg5k7vv9g==
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id
 af79cd13be357-8cb42268fb7mr859965485a.27.1771153592485; 
 Sun, 15 Feb 2026 03:06:32 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id
 af79cd13be357-8cb42268fb7mr859962585a.27.1771153592073; 
 Sun, 15 Feb 2026 03:06:32 -0800 (PST)
Received: from quoll ([178.197.223.140]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm546360325e9.9.2026.02.15.03.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 03:06:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 15 Feb 2026 12:06:28 +0100
Message-ID: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=NP94FmMc49hVak9d84xroc99UMOfASUZ7FO4Vb9UwNE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkai0cmoweuXzmNdkt3cUKsm8kSCLQVJPu23p+
 dCZSm7zbAmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZGotAAKCRDBN2bmhouD
 11qAD/wN+jA1lzX6+fvH+7NvijyyXmKjI69j+7amUOgM5sbk570RGatIFifeiMMYCzNsjRtka1N
 SK1h155UeEuyH4Bh28xMW0yl3B4RbpKRBgecF8bJOoauDz6gj89z70NAhEoCXnlMQzyliGE3BKi
 Ahxw8Ny/zGlGitabsYrEgLDKuVSld04+JP8Sog5HdJ35M1hsyWuZXSNr+jqW6HxZMPq5fhBdzXr
 5u07sXCHRdxtXIs+A6LZdb0qYJ3D3oSR874npKfRbML/aPlxh7DQXJPoWBoDL65GifRkJaHhZl2
 MjJDpmk/7UdZIzOdP56MOfqQlImW+obhbofUzlCs1cKDpZd8hVCB7LOBYj+bJw2dfZR5nGwgGuZ
 MKmrUgz9ADLHW7MgUaHtCdjIKKMF+PoQjoN1Zzo30F3SVWfda9kAEQK8GxotrYMrO4n6LI9kcAL
 Fwl8MNE2IFEYm5DVap6C+VDkyMhbmTb84uEMDJYMHqastkqmUxy05JsGSD217Kev8/4HnhENdLN
 HINqvMPYNNQTDLiPSGaaDq8A2zGrjc9XKAUK9kOHbF2DT8UZsu+SuYHn0DHl5L7anJl4Itr+pii
 caB1cZK16piHfC546QaES/WzkbiqD9u/sxAYzvAYEfsLIlrT6dpd6lKsaXed1zbkbjcXudDC5+I
 fgr4KP1y45xlKHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: pp1Ygj0YjJaNq27WipzH8iUFqEFN0wgg
X-Proofpoint-ORIG-GUID: pp1Ygj0YjJaNq27WipzH8iUFqEFN0wgg
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6991a8b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NNID--eWxax2qouwXSIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDA4OSBTYWx0ZWRfX2NdeTOYg5SuU
 eEnIm/vyvVktOs4F5zRatV81pp22WoYQG6z7PATEnVdK0clmBe9F6D8diFMUpgeoKBNHh93aiMG
 z8wvVU14oObCUuUq3iz7jFXtYCJOD+POtwiM4KHU6qR/2idLV1vbVQ5RFPg6GMPFqeByEedNfOs
 Spo7YP1CheSgbaMu9ESS4CO4r2fkrZsOOayWsAQWnWo+pjBjlMLa7D6+WrAjEufBioeN+syir+z
 su83voziHTHHQ+uLrIS+NvcbJktGAXFWO9z0aPjz5OgcbYBGNd1RfRGeiwAMYOqLMFWFoXpMcHo
 ReReIOGIzWxEaZQgX5u1ccBkC0XvT8rISgoBlTd6duCZgwShR8I8Ki4Wrzf3XO/fzGRrkdtMuqw
 zidHe8GGXe+rfa/agHyDVKo8pTQ6enVr/Fl9cvnZYm3ShIogQ3WYshtmhoML6SBah4IC6LpgH3E
 LC7P1I6gqSPHaRYB0/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150089
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH] efi: stmm: Constify struct efivar_operations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-efi@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 8647813E906
X-Rspamd-Action: add header
X-Spam: Yes

The 'struct efivar_operations' is not modified by the driver after
initialization, so it should follow typical practice of being static
const for increased code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index 7b04dd649629..3bea2ef50ef3 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -14,7 +14,6 @@
 #include "mm_communication.h"
 
 static struct efivars tee_efivars;
-static struct efivar_operations tee_efivar_ops;
 
 static size_t max_buffer_size; /* comm + var + func + data */
 static size_t max_payload_size; /* func + data */
@@ -520,6 +519,15 @@ static void tee_stmm_restore_efivars_generic_ops(void)
 	efivars_generic_ops_register();
 }
 
+static const struct efivar_operations tee_efivar_ops = {
+	.get_variable			= tee_get_variable,
+	.get_next_variable		= tee_get_next_variable,
+	.set_variable			= tee_set_variable,
+	.set_variable_nonblocking	= tee_set_variable_nonblocking,
+	.query_variable_store		= efi_query_variable_store,
+	.query_variable_info		= tee_query_variable_info,
+};
+
 static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 {
 	struct device *dev = &tee_dev->dev;
@@ -558,13 +566,6 @@ static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 			  MM_VARIABLE_COMMUNICATE_SIZE +
 			  max_payload_size;
 
-	tee_efivar_ops.get_variable		= tee_get_variable;
-	tee_efivar_ops.get_next_variable	= tee_get_next_variable;
-	tee_efivar_ops.set_variable		= tee_set_variable;
-	tee_efivar_ops.set_variable_nonblocking	= tee_set_variable_nonblocking;
-	tee_efivar_ops.query_variable_store	= efi_query_variable_store;
-	tee_efivar_ops.query_variable_info	= tee_query_variable_info;
-
 	efivars_generic_ops_unregister();
 	pr_info("Using TEE-based EFI runtime variable services\n");
 	efivars_register(&tee_efivars, &tee_efivar_ops);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
