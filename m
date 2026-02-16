Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNwUGzLckmn3zAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 09:58:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD0141C4B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 09:58:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4381C8F273;
	Mon, 16 Feb 2026 08:58:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63FF8C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 08:58:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G2Fomx2170175
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Feb 2026 08:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/Cena
 QjYJmbPE=; b=ULX1z3fasCSlAzu68vxdEiljLMsObjj12fNzu2uI57lGWTonId/
 q5IEtNWrfRy0fVRMG5astktZrdT1eaxZtm5Iqlbu6mNW4e94xoagm8TD3O+splTm
 ApKl0vQOQ9/e/Sj1aJrmJ5jg+ngOCDNicpzRERTBEJALN+cSn1bhIywtAAyrOerK
 QnZwa/2AeaGrlWbBaNTyltKBIgbBMpWen/vm39smIJ7uU00r/8zgu7e79q1Zd3oh
 U+Yow8fnVJzciwxHIpYiBrEPMT8aoUxuFAEIjguaKrHajxT6SGE/M/R+xh66UeYD
 KmkOL2dgEUJfzweq3e7G5E97T6cZ2z2qh6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9h2u8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 08:58:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3d11b913so1410768085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 00:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771232301; x=1771837101;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/CenaQjYJmbPE=;
 b=ecC91ElDuRgnYfMbdFRh4Z8nMak+EcGi/opnunu7FvigYZtwHnK6IOabxfK5INBlt1
 EaetZbJFdh5hKhbIzygvdV6irmGLPVPOSwuCG4dYOm++SF2LKdH/w4F55smIFr63xNzu
 UdZD7c1p0fNqViBSEryZBdkrhRlIUwFIgpCmJGnn7iQJeZrHI+8CfO5CHwqxdg8LjnD+
 vfS3gocLqLs5+yKRq7dH39LkCx01g99PlZO5AgV8aZer02DBDXzpFuxPYLJQezdg9iiR
 +mqqlNaKRNQ1+EzJEEvu/K52X8GRrr3qBvDuvD2u/fqaP3hxSKX/W596+BNZbCN0IfYR
 KjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771232301; x=1771837101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/CenaQjYJmbPE=;
 b=It/zRvmYJQ9HmkINM385s+2J8BR0xpJzo6RIbCbNLCeDhy+HesC8OxbMsHz7mH6OKZ
 IXrisCuKG4eGars0CjjTXqQGSDPEpxUJueKfMe+KWJROLaDNzuSdMr6NkGqpg1eVi/hV
 mNWx/iTed9RwOnOKYR/U+fzfDfKdQnM37ET6qtuHBGCwcJ1DHgQS92cmyhxi5HVOl5LK
 j2FHk8djqFgIlduYnOThBvM9QQiAuQZwoPDKNtKBX7cZUVAM3CXkAEejUgzsIKiPe/qS
 nTCjLI2vhuN0553bgeHtZ4dBVn02k4twqA6C3cA4yW/ZfLnEWAtubnElPR5IuH5nfwk/
 cA7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSvmSfG5BMFUh0Wm/ZFpq42K6b0fNFDfyVTxe8n0sl1BuVBCiv+cKN8p1iuICKyqErHQEXHOnqNP37UQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyPs4J8qtekcewjagBK+gcT3IPOPCKXZi7/vjqaNvcLVnpduyvD
 1I3xW6pnvZGeOUrwmDjsm3OpP3yaWBl8vVoimvZHIMErW8qdOnokx5OMqVr5Xonll9woahAkhxq
 2eAbNUFL9iUdgjQIrwfiw/03BoziYi+B8WbarzXVHHlDpT4DCPJlNu3Jc06OjH6OAuqlTt0WcTZ
 esJM8klKc=
X-Gm-Gg: AZuq6aK2VIIFZUOYh6aXgWrmHHrGt8IuyyzX/6ExHMdMXCNqoPS3xfcJKICZM6XJ9CK
 aJCxCsJObky/5486R8xiJ2msuaToTl19FIwYly6RVSEXw9EZ3hp6UrzKH+s2v9nJ+qN5rdzTsD4
 LAypZp7PaR1yRyojWaLcqhEfcrfLJHWHJy1kLuQZFwX8fiWpuIk09E5T1NjhqEpvCy0ePnrM87V
 /k2SYt23Bj0ug6PQ3P+SdPNVjnPRKxI9UT25AmYib5EW/XqFahR43O+CqeETazS5SiGuPN79E9Y
 yqMZBlEL5tYe3hJliveaTeKdGnwMLnmCsrs0yM3V2J5ymvzGxin8pMQx4uMDc9YhljN4qLMLXZR
 mXMkfSG7iUjcZ5fy0I+JpjTcAYHBCK2pJeNYlDQ==
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id
 af79cd13be357-8cb4224b5bfmr1046448585a.4.1771232301348; 
 Mon, 16 Feb 2026 00:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id
 af79cd13be357-8cb4224b5bfmr1046447085a.4.1771232300958; 
 Mon, 16 Feb 2026 00:58:20 -0800 (PST)
Received: from quoll ([178.197.223.140]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a420b1sm75752145e9.28.2026.02.16.00.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 00:58:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Feb 2026 09:58:17 +0100
Message-ID: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=XQCnyPJQzVxYvr61i18j/+QbSb66ztJhWd78xIkKraY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktwoPLSuKARQ8bypqMLbyogxrTd1SpNDCK4Xa
 k3um/HtrEKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcKAAKCRDBN2bmhouD
 1zhYD/954EhXNOna/XkOpCBJvRV7QyNkhRrlgOHPdpM2QLVLp/rOFm5BZTGoW1DGy813qm+wzMM
 gioGdxgx3GOPwCl5Af/p/AptAaVRZhCKmwNoKM1ARR59d4cIVPPHXQQ5YEu13ED2rvbNvxyo2YU
 TRm/Z7Y6mMTBGxDMGUS9UEzKBQp+IiTUnLIHDff1wnFJoeYg7F/+HMq3/8WDHL7VksBqxUYe9xw
 p00D7WSmxdjKL6ZZ58TfHBSmrRBbMWJIa/gqVxkJh2lNom3ztADtDUwZXpGvMtfk1JOfAF9iwOr
 4ZWRrdM3H0lMU9soWgu7Mzz9EFJ0UUXX5MmkQtQmYlrctq7gPscTzQImkbiAZUyQJTj255Ya3Vg
 TeoTz04pPt3Xs0/wOXz46Tn9T+fFN7jf0UUGS5k1DvMjRxvcR0h2wIQmjcovMQZ28Mf/ghra1Tl
 BTjiJlg1YDl1N3b51r/8ydnE2a2UiZDw6ObUnB6JLytV9RJhveAmRlTw939l0SsjrM+dDuHBdDz
 fIKydXp6fVT8umyE0gjb7+Mww2/HU32dNNxHWTf/FEW8ZUj/ThWtag+9F97ELx6+sdtg26ensrX
 5v9l2syWdlkJcZUHhEYjvhFLf0x7KW1Udi0yY02EaiR1+k3S40FG/QKHL4KP7ifBx6FniWAznGJ
 cBtjk4LkSmenVTg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: VyLntj_LXwuvmNNjOt426r8coCc7blBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX7LT3xLSdG6zJ
 ysA5xOF8yr4OtB2DrNGcBdrVuXHFgMPk2WPsX7rcgf7wWg8jYtw0/K07jAx1WnN6VbQKY6BTWAR
 oWKDxExGv1xOLCKHrYHWWwXYq2ncXrpSsSWjUipUHtFgMO+A+znFWKcIJxNIHCDM+UgdeeQWv+G
 Lv6Q8f/4NwWbEXnXCV3Gp6OSeiDDId2tXa1avqdGjt9wfO8IKgtPSgZ9w8GwS6Y4FRn6Kgt38Ma
 e/fYPWUfx/8NmrXpy+Q5zyfgrHcZMXJ8pAF2Aw1nJLsgnL2lc4vaV4glWueifJ4pyVoQRDYaVoX
 9kylrgt2jAozGiaHPICSW4C9qcJNLL9WfAwgdGxJKzt9uC0R6izwav1FFEXPWzMs0SE1iAF6+5a
 GiBmOB10XKP3EYreWuTldUTfXESYLRgC+3iqhQVbdxb2YZWti3QqCOKfwFwbG6D3qBUPWLoyR7j
 IeBADe/aJmHWXd+bKXg==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992dc2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=S3UOEAcGOv3Q9y8fZdcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VyLntj_LXwuvmNNjOt426r8coCc7blBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH] spi: stm32: Use NULL instead of 0 for pointer
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
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-spi@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 12BD0141C4B
X-Rspamd-Action: add header
X-Spam: Yes

Pointers should use NULL instead of explicit '0', as pointed out by
sparse:

  spi-stm32.c:1659:65: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/spi-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b99de8c4cc99..38f6bba38b07 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1656,7 +1656,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
 								     &rx_dma_desc, &rx_mdma_desc);
 			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
-				rx_dma_conf.peripheral_config = 0;
+				rx_dma_conf.peripheral_config = NULL;
 				rx_dma_desc = NULL;
 			}
 		}
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
